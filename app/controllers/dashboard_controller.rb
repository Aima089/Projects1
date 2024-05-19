class DashboardController < ApplicationController
    before_action :authenticate_user!
  def index
    @company_users = current_user.company.users

  end 

end
