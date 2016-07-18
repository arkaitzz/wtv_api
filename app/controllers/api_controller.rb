class ApiController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  def record_not_found
    render json:{
    message: 'Record not found'
    }.to_json, status: 404
  end

  def user_index
    @users = User.all
    render json: @users 
  end

  def user_library
    if params[:user_id]
      user = User.find(params[:user_id])
      @library = user.alive_tickets
    end
    render json: @library
  end

  def product_list
    @products = Product.all.by_newest
    render json: @products
  end

  def movie_list
    @films = Film.all.by_newest
    render json: @films
  end

  def serial_list
    @serials = Serial.all.by_newest
    render json: @serials
  end

  def purchase_by_ids
    if params[:user_id] && params[:purchase_id]
      user_params = User.find(params[:user_id]) # check if the user exists
      purchase_params = PurchaseOption.find(params[:purchase_id]) # check if the PurchaseOption exists
      purchase = Ticket.where(purchase_date: Time.now,
                              expiration_date: Time.now + 2.days,
                              user_id: user_params.id,
                              purchase_option_id: purchase_params.id,
                              product_id: purchase_params.product_id).new
      if purchase.valid?
        purchase.save
        render json:{
        message: 'Succesfully purchased',
        ticket: purchase
        }.to_json, status: 200
      else
        render json:{
        message: purchase.errors.messages
        }.to_json, status: 403
      end
    end
  end

end
