class MissionsController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create]
  before_action :set_mission, only: [:show, :edit, :update, :destroy]
  
  def index
    @missions = Mission.paginate(:page => params[:page], :per_page => 5)
  end

  def new
    @customer = Customer.new
    @customer.missions.build
  end

  def show
    @cus_lat, @cus_lng = @mission.customer.location.split(",")
    @user_lat, @user_lng = @mission.user.profile.location.split(",");
  end

  def create
    @customer = Customer.new(missions_params)
    @customer.missions.last.user_id = User.idle.class == "User" ? User.idle.id : User.idle.first.id  #boştaki eleman
    @customer.missions.last.state = true
    if @customer.save 
      redirect_to root_path , notice: "Kayıt başarıyla oluşturuldu!"
    else
      redirect_to customer_new, alert: "Tekrar deneyiniz."
    end
  end

  def edit
    redirect_to :back, alert: "Yetkisiz Erişim." unless permitted?
  end

  def update
  	redirect_to root_path, alert: "Yetkisiz Erişim." unless permitted?
    if @mission.update(mission_params)
      redirect_to @mission
    end
  end

  def destroy
  	@mission.delete
    redirect_to :back
  end

  private

  def permitted?
    current_user == @mission.user
  end

  def set_mission
    @mission = Mission.find(params[:id])
  end

  def missions_params
    params.require(:customer).permit(:first_name, :last_name, :location,
     :phone, missions_attributes: [:description])
  end
end
