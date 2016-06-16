class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.paginate(:page => params[:page], :per_page => 5)
  end

  def new
    @profile = Profile.new
  end

  def show
    @contunied = @profile.user.missions.where(state: true).paginate(:page => params[:contunied_page], :per_page => 5)
    @finished = @profile.user.missions.where(state: false).paginate(:page => params[:finished_page], :per_page => 5)
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

  def set_user
    @profile = Profile.find(params[:id])
  end

  def users_params
    params.require(:profile).permit(:first_name, :last_name, :location,
     :phone, :date_of_birth, :gender, :score)
  end
end
