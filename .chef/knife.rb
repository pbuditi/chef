# See http://docs.chef.io/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "pbuditi"
client_key               "#{current_dir}/pbuditi.pem"
validation_client_name   "mychm-validator"
validation_key           "#{current_dir}/mychm-validator.pem"
chef_server_url          "https://api.chef.io/organizations/mychm"
cookbook_path            ["#{current_dir}/../cookbooks"]
