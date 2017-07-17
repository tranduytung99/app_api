require "rails_helper"

describe Session::Login do
let(:user){FactoryGirl.create :user}
let(:authentication_token){FactoryGirl.create :authentication_token, user_id: user.id}

  context "Login user" do
    it "Login user fails with email not found" do
      get "/api/v1/login/session", params: {email: "zdasdsjd", password: "1221"}
      expect(response.status).to eq 400
    end
    it "Login success " do
      get "/api/v1/login/session", params: {email: user.email, password: user.password}
      expect(response.status).to eq 200
    end

    it "login faisl without email" do
      get "/api/v1/login/session", params: { password: user.password}
      expect(response.status).to eq 500
    end
  end

  context "Create user" do
    it "create success" do
      post "/api/v1/sign_up/user_sign_up", params: { email: Faker::Internet.email ,password: "password"}
      expect(response.status).to eq 201
    end

    it "create fails without email" do
      post "/api/v1/sign_up/user_sign_up", params: { password: "password"}
      expect(response.status).to eq 400
    end

    it "create fails without email without password" do
      post "/api/v1/sign_up/user_sign_up"
      expect(response.status).to eq 400
    end

  end
end
