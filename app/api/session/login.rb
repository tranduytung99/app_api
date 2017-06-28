# module Session
#   class Login < Grape::API
#     version 'v1', using: :path
#     format :json

#     helpers do
#       def user_params
#         params = ActionController::Parameters.new({
#          user: {
#           email: params[:email],
#           password: params[:password]
#          }
#         })
#         params.require(:user).permit(:email, :password)
#       end

#       def create
#         @user = User.new
#         if @user.save
#         else
#         end
#       end

#       def current_user
#         @user = User.find_by_email params[:email]
#         if @user.present? && @user.valid_password?(params[:password])
#         else
#           error_msg = 'Bad Authentication Parameters'
#           error!({ 'error_msg' => error_msg }, 401)
#         end
#       end
#     end

#     resource :sign_up do
#       post :user_sign_up do
#         create
#         {
#           user: @user
#         }
#       end
#     end

#     resource :login do
#       params do
#         requires :email, type: String
#         requires :password, type: String
#       end
#       get :session do
#         current_user
#         {
#           current: @user,
#           email: params[:email]
#         }
#       end
#     end
#   end
# end
