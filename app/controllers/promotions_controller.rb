class PromotionsController < ApplicationController
  before_action :set_promotion, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json
  
  # GET /promotions
  # GET /promotions.json
  def index
    @promotions = Promotion.order("created_at desc").where('playerid=?' , current_player.playerid)
	@bulbs = Notification.where('playerid = ?' , current_player.playerid).sum('bulb')

  end

  # GET /promotions/1
  # GET /promotions/1.json
  def show
    @promotion = Promotion.where('id=? and playerid=?', params[:id], current_player.playerid)[0]
	@promotion.read = 1
	@promotion.save
	

	@notification = Notification.where('notificationid=? and notification=?', @promotion.id, 'promotions')
	unless @notifcation.nil?
		@notification[0].read = 1
		@notification[0].bulb = 0
		@notification[0].save
	end
	
	@bulbs = Notification.where('playerid = ?' , current_player.playerid).sum('bulb')
	#@promotion["total_bulbs"] = @bulbs
	#@promotion.save
	
	respond_with @promotion

  end

  # GET /promotions/new
  def new
    @promotion = Promotion.new
  end

  # GET /promotions/1/edit
  def edit
  end

  # POST /promotions
  # POST /promotions.json
  def create
    @promotion = Promotion.new(promotion_params)

    respond_to do |format|
      if @promotion.save
		@promotion.update_notification
		#@promotion.push
        format.html { redirect_to promotions_path(:playerid=>current_player.playerid), notice: 'Promotion was successfully created.' }
        format.json { render json: @promotion, status: :created, location: @promotion }
      else
        format.html { render action: "new" }
        format.json { render json: @promotion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /promotions/1
  # PATCH/PUT /promotions/1.json
  def update
    respond_to do |format|
      if @promotion.update(promotion_params)
        format.html { redirect_to @promotion, notice: 'Promotion was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @promotion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /promotions/1
  # DELETE /promotions/1.json
  def destroy
    #@promotion = Promotion.find(params[:id])
    @promotion.destroy
    respond_to do |format|
      format.html { redirect_to promotions_url, notice: 'Promotion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_promotion
      @promotion = Promotion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def promotion_params
      params.require(:promotion).permit(:code, :description, :drawingtime, :enddate, :num_of_entries, :playerid, :read, :startdate)
    end
end
