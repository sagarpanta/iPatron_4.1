class NotificationsController < ApplicationController
  before_action :set_notification, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json
  
  
  # GET /notifications
  # GET /notifications.json
  def index
    @notifications = Notification.where('playerid=?', current_player.playerid)

	
	unless @notifications.nil?
		@notifications.each do |notification|
			notification.bulb = 0
			notification.save
		end
	end
  end

  # GET /notifications/1
  # GET /notifications/1.json
  def show
    @notification = Notification.where('id=? and playerid=?', params[:id], current_player.playerid)[0]
	@notification.read = 1
	@notification.bulb = 0
	@notification.save
	
	if @notification.notification == 'offers'
		@offer = Offer.find_by_id(@notification.notificationid)
		@offer.read = 1
		@offer.save
	elsif @notification.notification == 'events'
		@event = Event.find_by_id(@notification.notificationid)
		@event.read = 1
		@event.save
	elsif @notification.notification == 'promotions'
		@promotion = Promotion.find_by_id(@notification.notificationid)
		@promotion.read = 1
		@promotion.save
	end
  end

  # GET /notifications/new
  def new
    @notification = Notification.new
  end

  # GET /notifications/1/edit
  def edit
  end

  # POST /notifications
  # POST /notifications.json
  def create
    @notification = Notification.new(notification_params)

    respond_to do |format|
      if @notification.save
        format.html { redirect_to @notification, notice: 'Notification was successfully created.' }
        format.json { render :show, status: :created, location: @notification }
      else
        format.html { render :new }
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notifications/1
  # PATCH/PUT /notifications/1.json
  def update
    respond_to do |format|
      if @notification.update(notification_params)
        format.html { redirect_to @notification, notice: 'Notification was successfully updated.' }
        format.json { render :show, status: :ok, location: @notification }
      else
        format.html { render :edit }
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notifications/1
  # DELETE /notifications/1.json
  def destroy
    @notification.destroy
    respond_to do |format|
      format.html { redirect_to notifications_url, notice: 'Notification was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notification
      @notification = Notification.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notification_params
      params.require(:notification).permit(:code, :description, :notification, :read)
    end
end
