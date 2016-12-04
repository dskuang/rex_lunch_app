class RolesController < ApplicationController
  def index
    @users = User.order(:username)
  end

  def change
    user = User.find params[:user_id]
    if admin?
      user.add_role('admin')
    else
      user.remove_role('admin')
    end
  end

  private

  def admin?
    params[:role_setting] == 'admin'
  end
end
