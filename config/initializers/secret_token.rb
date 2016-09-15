# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.

Rails.application.config.secret_token = ENV['SECRET_TOKEN'] || '277a2feb049a668c8544fd0e41e1c0224785a41d1e0404dc1f0f7de83b248d284b7640d98b69d9f587469f81489aed0872d9a95b61cd772db84b45d6c81351c2'
Rails.application.config.secret_key_base = ENV['SECRET_KEY_BASE'] || 'fb8f1d874e05b598e0f40e6aac250868ce2c9c0cb5bce4a00f2e30e623cc7841a9176962688ca1d99f5c093c403248e7ee6484e544f92dc272d3553c1e9805a8'
