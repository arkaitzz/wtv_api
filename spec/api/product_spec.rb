require "rails_helper"

RSpec.describe ApiController, :type => :controller do
  describe "Check products list and order" do

    it "get movie list ordered by creation" do
      get :movie_list
      first_id = Film.order("created_at desc").first.id
      last_id = Film.order("created_at desc").last.id
      expect(response).to be_success
      expect(response).to have_http_status(200)
      body = JSON.parse(response.body)
      body.length.should == Film.all.count
      body.first['id'].should == first_id
      body.last['id'].should == last_id
    end

    it "get season list ordered by creation, chapters ordered by number" do
      get :serial_list
      first_id = Serial.order("created_at desc").first.id
      last_id = Serial.order("created_at desc").last.id
      expect(response).to be_success
      expect(response).to have_http_status(200)
      body = JSON.parse(response.body)
      body.length.should == Serial.all.count
      body.first['id'].should == first_id
      body.last['id'].should == last_id
    end

    it "get product list: movies and seasons ordered by creation" do
      get :product_list
      first_id = Product.order("created_at desc").first.id
      last_id = Product.order("created_at desc").last.id
      expect(response).to be_success
      expect(response).to have_http_status(200)
      body = JSON.parse(response.body)
      body.length.should == Product.all.count
      body.first['id'].should == first_id
      body.last['id'].should == last_id
    end

  end
end
