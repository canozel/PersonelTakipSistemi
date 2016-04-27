class MissionsController < ApplicationController
  def index
  end

  def new
  end

  def customer_new
  	@customers = Customer.new
    @customers.missions.build
  end

  def edit
  end

  def create
  	@customer = Customer.new(missions_params)
    @customers.missions.first.user_id = User.find_by(false) #boştaki eleman
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
  def missions_params
    params.require(:customer).permit(:first_name, :last_name, :location,
     :phone, missions_attributes: [:description])
  end
end
