# Load the rails application
require File.expand_path('../application', __FILE__)

Date::DATE_FORMATS.merge!(:default => "%d/%m/%Y")
Time::DATE_FORMATS.merge!(:default => "%H:%M")

# Initialize the rails application
Pccn::Application.initialize!
