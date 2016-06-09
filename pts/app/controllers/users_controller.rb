class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def new
    @profile = Profile.new
  end

  def show
  end

  def create
    @user = Profile.new(users_params)
    if @user.save 
      redirect_to user_path, notice: "Kayıt başarıyla oluşturuldu!"
    else
      redirect_to user_new, alert: "Tekrar deneyiniz."
    end
  end

  def edit
    redirect_to :back, alert: "Yetkisiz Erişim." unless permitted?
  end

  def update
    redirect_to root_path, alert: "Yetkisiz Erişim." unless permitted?
    if @user.update(users_params)
      redirect_to @user
    end
  end

  def destroy
    @user.delete
    redirect_to :back
  end

  private

  def permitted?
    current_user == @user
  end

  def set_mission
    @user = Profile.find(params[:id])
  end

  def users_params
    params.require(:profile).permit(:first_name, :last_name, :location,
     :phone, :date_of_birth, :gender, :score)
  end
end
