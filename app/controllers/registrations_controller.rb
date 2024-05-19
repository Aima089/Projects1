class RegistrationsController < Devise::RegistrationsController

    def create
        super do |user|
        resource.role = params[:user][:role] # Assign role from the sign-up form
        resource.save
        user.company_id = params[:user][:company_id]
        user.save
        end
      end
      def configure_sign_up_params
        devise_parameter_sanitizer.permit(:sign_up, keys: [:company_id])
      end
    
    private

    def sign_up_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
  end
  