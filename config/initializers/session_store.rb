# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_larc_session',
  :secret      => 'ab865639cfc779e52b2d6ce1aa8733d022907f80e42036618d17f09037df672f09a0cef868cb2ebedcdecdcfb9ebec3ce0d39c2eff85c60902237957ab8cbaf4'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
