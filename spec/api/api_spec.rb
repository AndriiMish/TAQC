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

    it 'verifies user can logout' do
      response = app_cl.user_logout
      expect(response.status).to eq(200)
    end

  end

  context 'boundary values 1' do
    it "verifies user can registered with '1' number in 'username' field " do
      body = app_cl.adjust_body(username: "1")
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

    it 'verifies user can logout' do
      response = app_cl.user_logout
      expect(response.status).to eq(200)
    end

  end

  context 'Number in each field' do
    it "verifies user can registered with '1' number in each' field " do
      body = app_cl.adjust_body(username: "1")
      body = app_cl.adjust_body(firstName: "1")
      body = app_cl.adjust_body(lastName: "1")
      body = app_cl.adjust_body(email: "1")
      body = app_cl.adjust_body(password: "1")
      body = app_cl.adjust_body(phone: "1")
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

    it 'verifies user can logout' do
      response = app_cl.user_logout
      expect(response.status).to eq(200)
    end

  end

  context 'Letter in each field' do
    it "verifies user can registered with 'q' number in each' field " do
      body = app_cl.adjust_body(username: "q")
      body = app_cl.adjust_body(firstName: "q")
      body = app_cl.adjust_body(lastName: "q")
      body = app_cl.adjust_body(email: "q")
      body = app_cl.adjust_body(password: "q")
      body = app_cl.adjust_body(phone: "q")
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

    it 'verifies user can logout' do
      response = app_cl.user_logout
      expect(response.status).to eq(200)
    end

  end

  context 'Letter and Number in each field' do
    it "verifies user can registered with 'q1' sequence in each' field " do
      body = app_cl.adjust_body(username: "q1")
      body = app_cl.adjust_body(firstName: "q1")
      body = app_cl.adjust_body(lastName: "q1")
      body = app_cl.adjust_body(email: "q1")
      body = app_cl.adjust_body(password: "q1")
      body = app_cl.adjust_body(phone: "q1")
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

    it 'verifies user can logout' do
      response = app_cl.user_logout
      expect(response.status).to eq(200)
    end

  end

  context 'Symbol in each field' do
    it "verifies user can registered with 'q1' sequence in each' field " do
      body = app_cl.adjust_body(username: "&")
      body = app_cl.adjust_body(firstName: "*")
      body = app_cl.adjust_body(lastName: "%")
      body = app_cl.adjust_body(email: "#")
      body = app_cl.adjust_body(password: "?")
      body = app_cl.adjust_body(phone: "!")
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

    it 'verifies user can logout' do
      response = app_cl.user_logout
      expect(response.status).to eq(200)
    end

  end
end 


