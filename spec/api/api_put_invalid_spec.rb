require_relative '../spec_helper'
require_relative 'api_client.rb'
require 'securerandom'

RSpec.describe 'Create -> Login -> Get' do

  app_cl = ApiClient.new
  body = app_cl.generate_random_body

  before(:all) { app_cl.login_as_default_user }

    context 'verify user info' do
        it 'verifies user can registered' do
            response = app_cl.create_user(body)
            expect(response.status).to eq(200)
        end

        it 'verifies user can login' do
            response = app_cl.user_login(body[:username], body[:password])
            expect(response.status).to eq(200)
        end

        it 'verifies user can get info' do
            response = app_cl.get_user(body[:username])
            expect(response.status).to eq(200)
        end
    end


    context 'verify user can update ID' do
        it 'verifies user can update with negative values' do
            #new = {id: -3}
            body[:id] = -5
            #response = app_cl.update_user(body[:username], app_cl.adjust_body(new))
            response = app_cl.update_user(body[:username], body)
            expect(response.status).to eq(400)
        end

        it 'verifies user can update with empty field' do
            body[:id] = ""
            response = app_cl.update_user(body[:username], body)
            expect(response.status).to eq(400)
        end

        it 'verifies user can update with specials symbols' do
            body[:id] = '@/#$)'
            response = app_cl.update_user(body[:username], body)
            expect(response.status).to eq(400)
        end

        it 'verifies user can update with length 50 symbols' do
            body[:id] = '3' * 50
            response = app_cl.update_user(body[:username], body)
            expect(response.status).to eq(400)
        end
    end

#!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    context 'verify user can update USER NAME' do
        it 'verifies user can not update username with empty field' do
            invalid_username = ''
            #body = app_cl.generate_random_body
            #app_cl.create_user(body)

            body = app_cl.generate_random_body
            response = app_cl.update_user(body[:username], app_cl.adjust_body(username: invalid_username))
            expect(response.status).to eq(400)
            user = app_cl.get_user(body[:username])
            expect(user[:username]).to eq(body[:username])
        end

        it 'verifies user can not update username with negative values' do
            invalid_username = -1
            response = app_cl.update_user(body[:username], app_cl.adjust_body(username: invalid_username))
            expect(response.status).to eq(400)
        end

        it 'verifies user can not update username with specials symbols' do
            invalid_username = '@#-/'
            response = app_cl.update_user(body[:username], app_cl.adjust_body(username: invalid_username))
            expect(response.status).to eq(400)
        end

        it 'verifies user can not update username with mixed values' do
            invalid_username = '@#-/Dark'
            response = app_cl.update_user(body[:username], app_cl.adjust_body(username: invalid_username))
            expect(response.status).to eq(400)
        end

        it 'verifies user can not update username with length 50 symbols' do
            invalid_username = 'K' * 50
            response = app_cl.update_user(body[:username], app_cl.adjust_body(username: invalid_username))
            expect(response.status).to eq(400)
        end
    end


    context 'verify user can update FIRST NAME' do
        it 'verifies user can update with 1 symbol' do
            body[:firstName] = 'F'
            response = app_cl.update_user(body[:username], body)
            expect(response.status).to eq(400)
        end

        it 'verifies user can update with empty field' do
            body[:firstName] = ""
            response = app_cl.update_user(body[:username], body)
            expect(response.status).to eq(400)
        end

        it 'verifies user can update with specials symbols' do
            body[:firstName] = '@/#$)'
            response = app_cl.update_user(body[:username], body)
            expect(response.status).to eq(400)
        end

        it 'verifies user can update with 50 letters' do
            body[:firstName] = 'X' * 50
            response = app_cl.update_user(body[:username], body)
            expect(response.status).to eq(400)
        end

        it 'verifies user can update with numerical values' do
            body[:firstName] = 123456
            response = app_cl.update_user(body[:username], body)
            expect(response.status).to eq(400)
        end
    end


    context 'verify user can update LAST NAME' do
        it 'verifies user can update with 1 symbol' do
            body[:lastName] = 'F'
            response = app_cl.update_user(body[:username], body)
            expect(response.status).to eq(500)
        end

        it 'verifies user can update with empty field' do
            body[:lastName] = ""
            response = app_cl.update_user(body[:username], body)
            expect(response.status).to eq(500)
        end

        it 'verifies user can update with specials symbols' do
            body[:lastName] = '@/#$)'
            response = app_cl.update_user(body[:lusername], body)
            expect(response.status).to eq(500)
        end

        it 'verifies user can update with 50 letters' do
            body[:lastName] = 'X' * 50
            response = app_cl.update_user(body[:username], body)
            expect(response.status).to eq(500)
        end

        it 'verifies user can update with numerical values' do
            body[:lastName] = 123456
            response = app_cl.update_user(body[:username], body)
            expect(response.status).to eq(500)
        end
    end


    context 'verify user can update EMAIL' do
        it 'verifies user can update with 1 symbol' do
            body[:email] = 'F'
            response = app_cl.update_user(body[:username], body)
            expect(response.status).to eq(500)
        end

        it 'verifies user can update with empty field' do
            body[:email] = ""
            response = app_cl.update_user(body[:username], body)
            expect(response.status).to eq(500)
        end

        it 'verifies user can update with specials symbols' do
            body[:email] = '@/#$)'
            response = app_cl.update_user(body[:username], body)
            expect(response.status).to eq(500)
        end

        it 'verifies user can update with 50 letters' do
            body[:email] = 'X' * 50
            response = app_cl.update_user(body[:username], body)
            expect(response.status).to eq(500)
        end

        it 'verifies user can update with numerical values' do
            body[:email] = 123456
            response = app_cl.update_user(body[:username], body)
            expect(response.status).to eq(500)
        end
    end



    context 'verify user can update PASSWORD' do
        it 'verifies user can update with 1 symbol' do
            body[:password] = 'F'
            response = app_cl.update_user(body[:username], body)
            expect(response.status).to eq(500)
        end

        it 'verifies user can update with empty field' do
            body[:password] = ""
            response = app_cl.update_user(body[:username], body)
            expect(response.status).to eq(500)
        end

        it 'verifies user can update with specials symbols' do
            body[:password] = '@/#$)'
            response = app_cl.update_user(body[:username], body)
            expect(response.status).to eq(500) 
        end

        it 'verifies user can update with 50 letters' do
            body[:password] = 'X' * 50
            response = app_cl.update_user(body[:username], body)
            expect(response.status).to eq(500)
        end

        it 'verifies user can update with numerical values' do
            body[:password] = 1
            response = app_cl.update_user(body[:username], body)
            expect(response.status).to eq(500)
        end
    end

    context 'verify user can update PHONE' do
        it 'verifies user can update with 1 symbol' do
            body[:password] = 'Fly'
            response = app_cl.update_user(body[:username], body)
            expect(response.status).to eq(500)
        end

        it 'verifies user can update with empty field' do
            body[:password] = ""
            response = app_cl.update_user(body[:username], body)
            expect(response.status).to eq(500)
        end

        it 'verifies user can update with specials symbols' do
            body[:password] = '@/#$)'
            response = app_cl.update_user(body[:username], body)
            expect(response.status).to eq(500) 
        end

        it 'verifies user can update with 50 letters' do
            body[:password] = 'X' * 50
            response = app_cl.update_user(body[:username], body)
            expect(response.status).to eq(500)
        end

        it 'verifies user can update with numerical values' do
            body[:password] = 1
            response = app_cl.update_user(body[:username], body)
            expect(response.status).to eq(500)
        end

        it 'verifies user can update with mixed values' do
            body[:password] = 'cre@2k'
            response = app_cl.update_user(body[:username], body)
            expect(response.status).to eq(500)
        end
    end

    context 'verify user can update USER STATUS' do
        it 'verifies user can update with negative values' do
            body[:userStatus] = -5
            response = app_cl.update_user(body[:username], body)
            expect(response.status).to eq(500)
        end

        it 'verifies user can update with alphabetical value' do
            body[:userStatus] = "Netw"
            response = app_cl.update_user(body[:username], body)
            expect(response.status).to eq(500)
        end

        it 'verifies user can update with empty field' do
            body[:userStatus] = ""
            response = app_cl.update_user(body[:username], body)
            expect(response.status).to eq(500)
        end

        it 'verifies user can update with specials symbols' do
            body[:userStatus] = '@/#$)'
            response = app_cl.update_user(body[:username], body)
            expect(response.status).to eq(500)
        end

        it 'verifies user can update with length 50 symbols' do
            body[:userStatus] = '3' * 50
            response = app_cl.update_user(body[:username], body)
            expect(response.status).to eq(500)
        end
    end
end
