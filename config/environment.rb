# Load the rails application
require File.expand_path('../application', __FILE__)

Date::DATE_FORMATS.merge!(:default => "%d/%m/%Y")
Time::DATE_FORMATS.merge!(:default => "%H:%M")

APP_VERSION = `git describe --always` unless defined? APP_VERSION

# Initialize the rails application
Pccn::Application.initialize!
