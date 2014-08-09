config = Rails.configuration.database_configuration[Rails.env]
config['adapter'] = 'postgres' if config['adapter'] == 'postgresql'
config['user'] = config.delete 'username'
config['logger'] = [Rails.logger, Logger.new("log/#{Rails.env}_db.log")]

DB = Sequel::Model.db = Sequel.connect(config)
Sequel::Model.db.sql_log_level = Rails.application.config.log_level || :info
