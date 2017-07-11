require 'swagger_helper'
describe 'User API' do
  path '/api/v1/user/create' do
    post 'Creates a user' do
      tags 'User'
      consumes 'application/json', 'application/xml'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          password: { type: :string }
        },
        required: [ 'email', 'password' ]
      }
      response '201', 'user created' do
        let(:user) { { email: Faker::Internet.email, password: "password" } }
        run_test!
      end
      response '400', ' email fails validate' do
        let(:user) { { email: 'foo', password: "password" } }
        run_test!
      end
      response '400', 'invalid request' do
        let(:user) { { email: Faker::Internet.email } }
        run_test!
      end
    end
  end

  path '/api/v1/detail/{id}' do
    get 'Retrieves a user' do
      tags 'Users'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, :type => :integer
      response '200', 'user found' do
        # schema type: :object,
        #   properties: {
        #     id: { type: :integer },
        #     email: { type: :string },
        #   },
        #   required: [ 'id', 'email' ]
        let(:id) { User.create(email: Faker::Internet.email, password: 'password').id }
        run_test!
      end
      response '500', 'blog not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
