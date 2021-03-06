# Settings specified here will take precedence over those in config/environment.rb

# In the development environment your application's code is reloaded on
# every request.  This slows down response time but is perfect for development
# since you don't have to restart the webserver when you make code changes.
config.cache_classes = false

# Log error messages when you accidentally call methods on nil.
config.whiny_nils = true

# Show full error reports and disable caching
config.action_controller.consider_all_requests_local = true
config.action_view.debug_rjs                         = true
config.action_controller.perform_caching             = false

# Don't care if the mailer can't send
config.action_mailer.raise_delivery_errors = false

# Config for hData-parser gem
HDATA_LOG_PATH = "#{RAILS_ROOT}/log/#{RAILS_ENV}.log"

# app config
LOCAL_MODE = true
BASE_URI = File.join(RAILS_ROOT, "test", "fixtures")
#BASE_URI = "http://localhost:8080/hData-REST/resources/hDataRecord/"
#BASE_URI = "http://localhost:3000/hdata_records/"
#BASE_URI = "http://meinmac.mitre.org:3000/hdata_records/"