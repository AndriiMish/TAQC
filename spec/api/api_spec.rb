require_relative '../spec_helper'
require_relative 'api_client.rb'
require 'securerandom'

RSpec.describe 'Create -> Login -> Get' do

  app_cl = ApiClient.new
  body = app_cl.generate_random_body

  before(:all) { app_cl.login_as_default_user }
=begin
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
            !expect(response.status).to eq(200)
        end

        it 'verifies user can update with empty field' do
            body[:id] = nil
            response = app_cl.update_user(body[:username], body)
            !expect(response.status).to eq(200)
        end

        it 'verifies user can update with specials symbols' do
            body[:id] = '@/#$)'
            response = app_cl.update_user(body[:username], body)
            expect(response.status).to eq(500)
        end

        it 'verifies user can update with length 50 symbols' do
            body[:id] = '3' * 50
            response = app_cl.update_user(body[:username], body)
            expect(response.status).to eq(500)
        end
    end
=end
    context 'verify user can update USERNAME' do
        it 'verifies user can not update username with empty field' do
            #new = {username: '@@@@@'}
            #body[:username] = '@@@@@'
            invalid_username = ''
            body = app_cl.generate_random_body
            app_cl.create_user(body)
            response = app_cl.update_user(body[:username], app_cl.adjust_body(username: invalid_username))
            !expect(response.status).to eq(200)
            #user = app_cl.get_user(body[:username])
            #expect(user[:username]).to eq(body[:username])
        end
    end
=begin
    context 'verify user can update FIRSTNAME' do
        it 'verifies user can update with 1 symbol' do
            body[:firstName] = 'F'
            response = body.update_user(body[:username], body)
            !expect(response.status).to eq(200)
        end

        it 'verifies user can update with empty field' do
            body[:firstName] = nil
            response = body.update_user(body[:username], body)
            !expect(response.status).to eq(200)

        end

        it 'verifies user can update with specials symbols' do
            body[:firstName] = '@/#$)'
            response = body.update_user(body[:username], body)
            !expect(response.status).to eq(200)
        end

        it 'verifies user can update with 50 letters' do
            body[:firstName] = 'X' * 50
            response = body.update_user(body[:username], body)
            !expect(response.status).to eq(200)
        end

        it 'verifies user can update with numerical values' do
            body[:firstName] = 123456
            response = body.update_user(body[:username], body)
            !expect(response.status).to eq(200)
        end
    end


    context 'verify user can update LASTNAME' do
        it 'verifies user can update with 1 symbol' do
            body[:lastName] = 'F'
            response = body.update_user(body[:lastName], body)
            !expect(response.status).to eq(200)
        end

        it 'verifies user can update with empty field' do
            body[:firstName] = nil
            response = body.update_user(body[:username], body)
            !expect(response.status).to eq(200)

        end

        it 'verifies user can update with specials symbols' do
            body[:firstName] = '@/#$)'
            response = body.update_user(body[:username], body)
            !expect(response.status).to eq(200)
        end

        it 'verifies user can update with 50 letters' do
            body[:firstName] = 'X' * 50
            response = body.update_user(body[:username], body)
            !expect(response.status).to eq(200)
        end

        it 'verifies user can update with numerical values' do
            body[:firstName] = 123456
            response = body.update_user(body[:username], body)
            !expect(response.status).to eq(200)
        end
    end

    context 'verify user can update EMAIL' do
        it 'verifies user can update ' do
            new = {id: -3}
            response = body.adjust_body(new)
            response = body.update_user(new)
            expect(response.status).to eq(400)
        end
    end

    context 'verify user can update PASSWORD' do
        it 'verifies user can update ' do
            new = {id: -3}
            response = body.adjust_body(new)
            response = body.update_user(new)
            expect(response.status).to eq(400)
        end
    end

    context 'verify user can update PHONE' do
        it 'verifies user can update ' do
            new = {id: -3}
            response = body.adjust_body(new)
            response = body.update_user(new)
            expect(response.status).to eq(400)
        end
    end

    context 'verify user can update USER STATUS' do
        it 'verifies user can update ' do
            new = {id: -3}
            response = body.adjust_body(new)
            response = body.update_user(new)
            expect(response.status).to eq(400)
        end
    end
=end

end
