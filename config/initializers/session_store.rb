# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_cars_session',
  :secret      => 'ecbad67708b6e703f083e60dd3e90430b0aea2e908c006e54d81d04736bd0058608b4f21907e3a55ff8202012fb3e2b75a829a4cf9c5da6ebf354172214645d6'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
