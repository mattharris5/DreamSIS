require 'yaml'

on_app_servers do
  config_file_path = File.join(config.shared_path, "config", "api-keys.yml")
  API_KEYS = YAML.load_file(config_file_path)
  access_token = API_KEYS["rollbar"]["server_side_access_token"]
  run "curl https://api.rollbar.com/api/1/deploy/ --silent -F access_token=#{access_token} -F environment=#{config.environment} -F revision=#{config.revision} -F local_username=#{config.deployed_by}"
end

on_app_servers do
  sudo "chown -R deploy #{config.shared_path}/tmp/"
  sudo "monit restart all -g DreamSIS_sidekiq"  
end
