# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_openid_sample_session',
  :secret      => '3c99f0223a638840ef2cc98af83591fdab89ec88f48c49036a2b8c32d5d984c79166073877d0396cc947668112a6c2e2a161b3e90ca0eb979b626b7b7aa3c457'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
