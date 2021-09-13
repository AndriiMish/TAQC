require_relative '../spec_helper'
require_relative 'api_client.rb'

RSpec.describe 'Create -> Login -> Get' do

    app_cl = ApiClient.new
    body = {
        :id => "1",
        :username => "Nick",
        :firstName=> "Boro",
        :lastName => "gjg",
        :email => "asad@kk.mail",
        :password => "1212",
        :phone => "231323123"
    }

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

 ###################################################################

    context 'verify updating user info with invalid data' do
        it 'verifies user can update invalid ID' do
            new = {:id => -3}
            response = app_cl.update_user(body[:username], body.merge!(new){|key, b, n| b = n})
            expect(response.status).to eq(400)
        end
    end
end