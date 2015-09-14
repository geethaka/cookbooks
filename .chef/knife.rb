# See https://docs.getchef.com/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "bihan"
client_key               "#{current_dir}/bihan.pem"
validation_client_name   "testcoffee-validator"
validation_key           "#{current_dir}/testcoffee-validator.pem"
chef_server_url          "https://testchef01.cloud.pearson.com/organizations/testcoffee"
cookbook_path            ["#{current_dir}/../cookbooks"]
