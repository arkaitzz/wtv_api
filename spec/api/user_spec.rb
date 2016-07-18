require "rails_helper"

RSpec.describe ApiController, :type => :controller do
  describe "Check user purchases and library" do

    it "user performs a purchase" do
      get :purchase_by_ids, {:user_id => '1', :purchase_id => '2'}
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "user performs a purchase that he already has alive, should receive 403" do
      purchase = PurchaseOption.first
      user = User.first
      # Generate a ticket as if was purchased yesterday, still alive
      Ticket.where(purchase_date: Time.now - 1.day,
                  expiration_date: Time.now + 1.days,
                  user_id: user.id,
                  purchase_option_id: purchase.id,
                  product_id: purchase.product_id).create
      # Try to generate a new ticker for something alive
      get :purchase_by_ids, {:user_id => user.id, :purchase_id => purchase.id}
      expect(response).to have_http_status(403)
    end

    it "User library, ordered by ticket time left" do
      user = User.first
      for i in [1,5,7] do
        purchase_date = Time.now - (rand*100).minutes
        purchase = PurchaseOption.find(i)
        Ticket.where(purchase_date: purchase_date,
                    expiration_date: purchase_date + 2.days,
                    user_id: user.id,
                    purchase_option_id: purchase.id,
                    product_id: purchase.product_id).create
      end
      get :user_library, {:user_id => user.id}
      expect(response).to be_success
      expect(response).to have_http_status(200)
      body = JSON.parse(response.body)
      body[0]['time_left'].should be <= body[2]['time_left']
      body[1]['time_left'].should be <= body[2]['time_left']
    end

  end
end
