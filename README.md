# wtv_api

  get '/api/users' => User list
  get '/api/users/:user_id/library' => User library
  get '/api/catalog/movies' => Movie catalog
  get '/api/catalog/seasons' => Season catalog
  get '/api/catalog/' => Full catalog
  # Purchase a title by user_id & purchase_option_id
  get '/api/:user_id/purchase/:purchase_id' => Purchase title
