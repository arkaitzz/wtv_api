class ProductsController < ApplicationController

  def index
    @products = Product.all.by_newest
    render json: @products
  end

  def movie_list
    @films = Film.all.order(created_at: :desc)
    render json: @films
  end

  def serial_list
    @films = Serial.all.order(created_at: :desc)
    render json: @films
  end

end
