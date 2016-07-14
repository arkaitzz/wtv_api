class ApiController < ActionController::API

  def user_index
    @users = User.all
    render json: @users 
  end

end
