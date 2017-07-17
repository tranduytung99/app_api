Doorkeeper.configure do
  # Change the ORM that doorkeeper will use (needs plugins)
  orm :active_record

  resource_owner_authenticator do
    warden.authenticate!(scope: :user)
  end
  resource_owner_from_credentials do |routes|
    user = User.find_by email: params[:email]
    user if user && user.valid_password?(params[:password])
  end
end
Doorkeeper.configuration.token_grant_types << "password"
