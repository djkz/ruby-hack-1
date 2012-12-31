require 'spec_helper'

describe WelcomeController do
  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
    it "should create game session" do
      get "index"
      session[:game].should be_instance_of Game
    end
  end
  describe "GET 'guess'" do
    it "will let us post a letter" do
      get "guess", id: "a"
      response.should be_success
    end
  end

end
