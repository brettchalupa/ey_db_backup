require 'aws/s3'
require 'thor'

class DatabaseExport < Thor
  include Thor::Actions
  
  desc "run_export", "Exports EY database backup to local machine"
  def run_export
    
    aws_config = AWSConfiguration.new
    aws_config.read_from_yaml
    
    AWS::S3::Base.establish_connection!(
      :access_key_id     => aws_config.access_key_id ,
      :secret_access_key => aws_config.secret_access_key
    )

    bucket_name = aws_config.bucket_name
    export_path = aws_config.export_path

    bucket_files = AWS::S3::Bucket.objects(bucket_name)
    

    most_recent = bucket_files[0]

    bucket_files.each do |n|
      if n.about["last-modified"] > most_recent.about["last-modified"]
        most_recent = n
      end
    end

    open("#{export_path}#{most_recent.key}", 'w') do |file|
        file.write(AWS::S3::S3Object.stream(most_recent.key, bucket_name))
    end
  end
end

DatabaseExport.start

