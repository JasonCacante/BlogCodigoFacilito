class UsersController < ApplicationController
  def edit
  end

  def update
    current_user.update(user_params)
    redirect_back(fallback_location: root_path)
  end

  private

  def user_params
    params.required(:user).permit(:avatar)
  end
end
