WtvApi::Application.routes.draw do

  get '/api/users' => 'api#user_index'
  get '/api/users/:user_id/library' => 'api#user_library'
  get '/api/catalog/movies' => 'api#movie_list'
  get '/api/catalog/seasons' => 'api#serial_list'
  get '/api/catalog/' => 'api#product_list'
  # Purchase a title by user_id & purchase_option_id
  get '/api/:user_id/purchase/:purchase_id' => 'api#purchase_by_ids'

end
