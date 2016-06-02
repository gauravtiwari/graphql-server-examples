require "yaml"
settings = YAML::load_file("config/db.yml")
# Sequel Configuration
DB = Sequel.connect(settings[ENV['RACK_ENV']])
