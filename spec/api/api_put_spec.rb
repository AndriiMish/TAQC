require_relative '../spec_helper'
require_relative 'api_client.rb'
require 'securerandom'

RSpec.describe 'PUT method checking to the any data in the body' do
	api_cl = ApiClient.new
	body = api_cl.generate_random_body
	

	valid_body = {
        "id": rand(10000),
        "username": "user_#{SecureRandom.hex}",
        "firstName": SecureRandom.hex,
        "lastName": SecureRandom.hex,
        "email": "#{SecureRandom.hex}@gmail.com",
        "password": SecureRandom.hex,
        "phone": SecureRandom.hex,
        "userStatus": 0}
	
	
	

	# Positive Functional Testing
	valid_body.each_pair{|key, value|
		context 'Valid PUT method checking' do
			it 'verifies that user can edit any data in the body' do
				api_cl.create_user(body)
				body[key] = value
				api_cl.update_user(body[key], body)
				api_cl.user_login(body[:username], body[:password])
				response = api_cl.get_user(body[:username])
				expect(response.status).to eq(200)
				api_cl.user_logout()
				api_cl.delete_user(body[:username])
			end
		end}
end	
	