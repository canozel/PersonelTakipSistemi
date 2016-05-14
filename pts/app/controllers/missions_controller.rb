class MissionsController < ApplicationController
  before_action :authenticate_user!, except: [:customer_new]
  before_action :set_mission, only: [:show, :edit, :update, :destroy]
  layout "home_page", only: [:customer_new]

  def index
    @missions = Mission.all
  end

  def new
  end

  def show

  end

  def customer_new
  	@customers = Customer.new
    @customers.missions.build
  end

  def edit
  end

  def create
  	@customer = Customer.new(missions_params)
    @customers.missions.first.user_id = User.idle.id #boştaki eleman
    if @customer.save 
      redirect_to customer_new, notice: "Kayıt başarıyla oluşturuldu!"
    else
      redirect_to customer_new, alert: "Tekrar deneyiniz."
    end
  end

  def update
  	
  end

  def destroy
  	
  end

  private

  def set_mission
    @mission = Mission.find(params[:id])
  end

  def missions_params
    params.require(:customer).permit(:first_name, :last_name, :location,
     :phone, missions_attributes: [:description])
  end
end
