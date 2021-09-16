require_relative '../spec_helper'
require_relative 'api_client.rb'
require 'securerandom'

RSpec.describe 'PUT method checking to the any data in the body' do
	api_cl = ApiClient.new
	body = api_cl.generate_random_body
	
	
	api_cl.create_user(body)




	# Positive Functional Testing
		context 'PUT method checking' do
				it 'verifies that user can be edited by using valid data' do
					valid_body = {"id": rand(1000),
								  "username": 'user_name',
								  "firstName": 'Robb',
								  "lastName": 'Stark',
								  "email": 'kingofthenorth@gmail.com',
								  "password": SecureRandom.hex,
								  "phone": '0000000',
								  "userStatus": 0}
					valid_body.each_pair{|key, value| body[key] = value
					api_cl.update_user(body[key], body)}
					
					api_cl.user_login(body[:username], body[:password])
					response = api_cl.get_user(body[:username])
					expect(response.status).to eq(200)
					api_cl.user_logout()
					api_cl.delete_user(body[:username])	
				end
				
				valid_body = {"id": rand(1000),
							  "username": 'user_name2',
							  "firstName": 'Jon',
							  "lastName": 'Snow',
							  "email": 'nightswatch@gmail.com',
							  "password": SecureRandom.hex,
							  "phone": '11111111',
							  "userStatus": 0}
							  
				api_cl.create_user(body)
				valid_body.each_pair{|key, value| 
				it 'verifies that user can edit any data by using valid data' do
					body[key] = value
					api_cl.update_user(body[key], body)
					api_cl.user_login(body[:username], body[:password])
					response = api_cl.get_user(body[:username])
					expect(response.status).to eq(200)
					api_cl.user_logout()
				end}
				api_cl.delete_user(body[:username])	
				
				
				# Negative Functional testing
				it 'verifies that created user can be edited by using mixed data' do
					sub_body = api_cl.generate_random_body
					sub_body.each_pair{|key, value| body[key] = value
					api_cl.update_user(body[key], body)}
					
					api_cl.user_login(body[:username], body[:password])
					response = api_cl.get_user(body[:username])
					expect(response.status).to eq(400)
					api_cl.user_logout()
					api_cl.delete_user(body[:username])	
				end
				
				sub_body = api_cl.generate_random_body
				
				sub_body.each_pair{|key, value| 
					it 'verifies that user can edit any data by using mixed data' do
						api_cl.create_user(body)
						body[key] = value
						api_cl.update_user(body[key], body)
						api_cl.user_login(body[:username], body[:password])
						response = api_cl.get_user(body[:username])
						expect(response.status).to eq(400)
						api_cl.user_logout()
						api_cl.delete_user(body[:username])	
					end}
				
				it 'verifies that user can be edited by using numbers' do
					api_cl.create_user(body)
					body.each_pair{|key, value| body[key].is_a?(Integer) ? body[key] += 1 : body[key] += '1'
					api_cl.update_user(body[key], body)}
					api_cl.user_login(body[:username], body[:password])
					response = api_cl.get_user(body[:username])
					expect(response.status).to eq(400)
					api_cl.user_logout()
					api_cl.delete_user(body[:username])		
				end
				
				xit 'verifies that user can be edited by using symbols' do
					api_cl.create_user(body)
					body.each_pair{|key, value| body[key] += '#' if !body[key].is_a?(Integer)
					api_cl.update_user(body[key], body)}
					api_cl.user_login(body[:username], body[:password])
					response = api_cl.get_user(body[:username])
					expect(response.status).to eq(400)
					api_cl.user_logout()
					api_cl.delete_user(body[:username])		
				end
			
		end
end	
