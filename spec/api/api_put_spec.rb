require_relative '../spec_helper'
require_relative 'api_client.rb'
require 'securerandom'

RSpec.describe 'PUT method checking to the any data in the body' do
	api_cl = ApiClient.new
	body = api_cl.generate_random_body
	
	before(:all) do
		api_cl.create_user(body)
	end
	
	# Positive Functional Testing
	
	it 'verifies that username can be edited' do
		body[:username] = 'KingOfTheNorth'
		response = api_cl.update_user(body[:username], body)
		expect(response.status).to eq(200)
	end
	
	it 'verifies that first name can be edited' do
		body[:firstName] = 'Robb'
		response = api_cl.update_user(body[:username], body)
		expect(response.status).to eq(200)
	end
	
	it 'verifies that last name can be edited' do
		body[:lastName] = 'Stark'
		response = api_cl.update_user(body[:username], body)
		expect(response.status).to eq(200)
	end
	
	it 'verifies that email can be edited' do
		body['email'] = 'robb-stark@gameofthrones.com'
		response = api_cl.update_user(body[:username], body)
		expect(response.status).to eq(200)
	end
	
	it 'verifies that password can be edited' do
		body[:password] = 'rob-stark@gameofthrones.com'
		response = api_cl.update_user(body[:username], body)
		expect(response.status).to eq(200)
	end
	
	it 'verifies that phone number can be edited' do
		body[:phone] = rand(100000).to_s
		response = api_cl.update_user(body[:username], body)
		expect(response.status).to eq(200)
	end
	
	# Negative functional testing
	# Username
	it 'verifies that username can not be less than 2 symbols' do
		body[:username] = 'u'
		response = api_cl.update_user(body[:username], body)
		!expect(response.status).to eq(200)
	end
	
	# First name
	it 'verifies that first name can not be less than 2 symbols' do
		body[:firstName] = 'O'
		response = api_cl.update_user(body[:username], body)
		!expect(response.status).to eq(200)
	end
	
	it 'verifies that first name can not consist numbers' do
		body[:firstName] = '1232151'
		response = api_cl.update_user(body[:username], body)
		!expect(response.status).to eq(200)
	end
	
	it 'verifies that first name can not consist symbols' do
		body[:firstName] = '(*#&%&'
		response = api_cl.update_user(body[:username], body)
		!expect(response.status).to eq(200)
	end
	
	it 'verifies that first name can not start with low letter' do
		body[:firstName] = 'robb'
		response = api_cl.update_user(body[:username], body)
		!expect(response.status).to eq(200)
	end
	
	it 'verifies that last name can not consist mixed data' do
		body[:firstName] = 'robbA&%34%^'
		response = api_cl.update_user(body[:username], body)
		!expect(response.status).to eq(200)
	end
	
	# Last name
	it 'verifies that last name can not be less than 2 symbols' do
		body[:lastName] = 'R'
		response = api_cl.update_user(body[:username], body)
		!expect(response.status).to eq(200)
	end
	
	it 'verifies that last name can not consist numbers' do
		body[:lastName] = '123'
		response = api_cl.update_user(body[:username], body)
		!expect(response.status).to eq(200)
	end
	
	it 'verifies that last name can not consist symbols' do
		body[:lastName] = '((($!'
		response = api_cl.update_user(body[:username], body)
		!expect(response.status).to eq(200)
	end
	
	it 'verifies that last name can not start with low letter' do
		body[:lastName] = 'stark'
		response = api_cl.update_user(body[:username], body)
		!expect(response.status).to eq(200)
	end
	
	it 'verifies that first name can not consist mixed data' do
		body[:lastName] = 'stark134@*$AA'
		response = api_cl.update_user(body[:username], body)
		!expect(response.status).to eq(200)
	end
	
	# Email
	it 'verifies that email can not be less than 2 symbols' do
		body[:email] = 'R'
		response = api_cl.update_user(body[:username], body)
		!expect(response.status).to eq(200)
	end
	
	it 'verifies that email can not consist symbols' do
		body[:email] = '(%#@^^'
		response = api_cl.update_user(body[:username], body)
		!expect(response.status).to eq(200)
	end
	
	it 'verifies that email can not consist mixed data' do
		body[:lastName] = 'rstark#%%@11@*$AA'
		response = api_cl.update_user(body[:username], body)
		!expect(response.status).to eq(200)
	end
	
	it 'verifies that email can not be created without @post.com' do
		body[:lastName] = 'rob-stark'
		response = api_cl.update_user(body[:username], body)
		!expect(response.status).to eq(200)
	end
	
	# Password
	
	it 'verifies that password can not be less than 8 symbols' do
		body[:password] = '1234'
		response = api_cl.update_user(body[:username], body)
		!expect(response.status).to eq(200)
	end
	
	it 'verifies that password can not be more than 50 symbols' do
		body[:password] = '1' * 51
		response = api_cl.update_user(body[:username], body)
		!expect(response.status).to eq(200)
	end
	
	
	
	
	
	
	
	
end