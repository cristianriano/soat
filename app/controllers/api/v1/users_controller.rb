class Api::V1::UsersController < Api::BaseController

  def create
    @user = User.new(user_params)
    @user.confirmed_at = DateTime.now
    if @user.save
      render status: 201, template: 'api/v1/users/show'
    else
      render status: 400, json: @user.errors.messages.to_json
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.update(params[:id], user_params)
    render status: 200, template: 'api/v1/users/show'
  end

  def destroy
    @user = User.find(params[:id]).destroy
    render status: 200, template: 'api/v1/users/show'
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :name, :lastname, :document, :document_type, :phone)
  end
end
