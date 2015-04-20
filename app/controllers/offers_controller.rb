class OffersController < ApplicationController
  before_action :set_offer, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json
  
  
  # GET /offers
  # GET /offers.json
  def index
    @offers = Offer.order("created_at desc").where('playerid = ?', current_player.playerid)
	@bulbs = Notification.where('playerid = ?' , current_player.playerid).sum('bulb')
  end

  # GET /offers/1
  # GET /offers/1.json
  def show
    @offer = Offer.where('id=? and playerid=?', params[:id], current_player.playerid)[0]
	@offer.read = 1
	@offer.save

	@notification = Notification.where('notificationid = ? and notification = ?', @offer.id, 'offers')
	@notification[0].read = 1
	@notification[0].bulb = 0
	@notification[0].save
	

	@bulbs = Notification.where('playerid = ?' , current_player.playerid).sum('bulb')

	respond_with @offer
  end

  # GET /offers/new
  def new
    @offer = Offer.new
  end

  # GET /offers/1/edit
  def edit
  end

  # POST /offers
  # POST /offers.json
  def create
    @offer = Offer.new(offer_params)

    respond_to do |format|
      if @offer.save
		@offer.update_notification
		#@offer.push

        format.html { redirect_to offers_path(:playerid => current_player.playerid)}
		#offer_path(@offer, :playerid=> current_player.playerid), notice: 'Offer was successfully created.' }
        format.json { render json: @offer, status: :created, location: @offer }
      else
        format.html { render action: "new" }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /offers/1
  # PATCH/PUT /offers/1.json
  def update
    respond_to do |format|
      if @offer.update(event_params)
        format.html { redirect_to @offer, notice: 'Offer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offers/1
  # DELETE /offers/1.json
  def destroy
    @offer.destroy
    respond_to do |format|
      format.html { redirect_to offers_url, notice: 'Offer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offer
      @offer = Offer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def offer_params
      params.require(:offer).permit(:code, :description, :startdate, :enddate, :playerid, :read)
    end
end
