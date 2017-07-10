module Session
  class Login < Grape::API
    version 'v1', using: :path
    format :json
    rescue_from :all

    resource :index do
      get :index_user do
        User.all
     end
    end

    resource :detail do
      get ':id', requirements: { id: /[0-9]*/ } do
       User.find(params[:id])
      end
    end

    resource :delete do
      delete ':id' do
        delete_user
      end
    end

    resource :update do
      put ':id' do
        @user = User.find_by id: params[:id]
        @user.update_attributes user_params
      end
    end

    helpers do

      def delete_user
        @user = User.find_by id: params[:id]
        @user.destroy
      end

      def user_params2
      # params.require(:user).permit!
       params.require(:user).permit!
      end

      def user_params
        params_user = ActionController::Parameters.new({
         user: {
          email: params[:email],
          password: params[:password]
         }
        })
        params_user.require(:user).permit(:email, :password)
      end

      def create
        @user = User.new user_params
        if @user.save
          @user
        else
        error!({status_code: 404,
          content: "Create User failure"}, 400)
        end
      end

      def current_user
        @user = User.find_by_email params[:email]
        if @user.present? && @user.valid_password?(params[:password])
           token = @user.authentication_token.token
          status 200
          {"email": @user.email, "token": token}
        else
          error!({status_code: 500,
          content: "Not Found user"}, 400)
        end
      end
    end

    resource :user do
      post :create do
        create
      end
    end

    resource :sign_up do
      post :user_sign_up do
        create
      end
    end

    resource :login do
      params do
        requires :email, type: String
        requires :password, type: String
      end
      get :session do
        current_user
      end
    end
  end
end
