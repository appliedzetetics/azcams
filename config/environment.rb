# Load the rails application
require File.expand_path('../application', __FILE__)

Date::DATE_FORMATS.merge!(:default => "%d/%m/%Y")
Time::DATE_FORMATS.merge!(:default => "%H:%M")


# Initialize the rails application
Pccn::Application.initialize!

APP_VERSION = File.read('config/version')
SPOOL_PREFIX = "/var/spool/azcams"

Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8