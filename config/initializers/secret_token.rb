# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
WtvApi::Application.config.secret_key_base = 'b43913bb9c86413fc8b7b02533f48a525954591fa668407f31bee770f9727db3e083155ef86af3e992cfaf0a47845d6d11ad01d57885e30c402d6ed671d92e1b'
