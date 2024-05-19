class UsersController < ApplicationController
    def index
        if current_user && current_user.company
          @company_users = current_user.company.users
        else
          # Handle case when current user is not authenticated or has no company
          redirect_to root_path, notice: "Please login and associate with a company."
        end
      end
end