require 'aws/s3'

Given /^I have Amazon S(\d+) credentials located in a file$/ do |arg1|
  @aws_config = AWSConfiguration.new
  @aws_config.read_from_yaml
end

Given /^I have a database hosted on Amazon S(\d+)$/ do |arg1|
  AWS::S3::Base.establish_connection!(
    :access_key_id     => @aws_config.access_key_id ,
    :secret_access_key => @aws_config.secret_access_key
  )
end

Given /^I have a database backup on Amazon S(\d+)$/ do |arg1|
  AWS::S3::S3Object.store 'aww_yeah', 'awwwww yeah', 'bc_images'
end

When /^I run the script to export the database$/ do
  DatabaseExport.new.run_export(@aws_config.bucket_name, @aws_config.export_path)
end

Then /^I should have successfully exported the database to my local directory$/ do
 File.exists?('backup_db')
end

