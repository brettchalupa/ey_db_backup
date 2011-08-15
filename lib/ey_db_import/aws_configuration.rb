class AWSConfiguration
  require 'yaml'

  attr_accessor :access_key_id
  attr_accessor :secret_access_key
  attr_accessor :bucket_name
  attr_accessor :export_path

  def read_from_yaml
    s3_credentials_yml = YAML.load_file("config/config.yml")
    @access_key_id =  s3_credentials_yml["access_key_id"]
    @secret_access_key = s3_credentials_yml["secret_access_key"]
    @bucket_name = s3_credentials_yml["bucket_name"]
    @export_path = s3_credentials_yml["export_path"]
  end

end
