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
    environment = aws_config.environment
    databases = aws_config.databases

    databases.each do |m|

      bucket_files = AWS::S3::Bucket.objects(bucket_name)

      


      bucket_files.keep_if {|v| v.key.include? "#{environment}.#{m}"}

      puts "+++++++"

      bucket_files.each do |x|
        print x.key
        print " "
        print x.about["last-modified"]
        print "\n"
      end

      most_recent = bucket_files[0]

      puts "-------"

      bucket_files.each do |n|
        if n.about["last-modified"] > most_recent.about["last-modified"]
          most_recent = n
        end
      end

      puts "Backing up #{most_recent.key} to #{export_path}#{most_recent.key}"
      

      if !FileTest::directory?("#{export_path}#{environment}.#{m}")
        Dir::mkdir("#{export_path}#{environment}.#{m}")
      end

      counter = 0
      
      puts "File being backed up:"
      print most_recent.key
      print " "
      print most_recent.about["last-modified"]
      print " Size: "
      print most_recent.about["content-length"]
      print "\n"


      puts "Current transfer status:"
      
      open("#{export_path}#{most_recent.key}", 'w') do |file|
          AWS::S3::S3Object.stream(most_recent.key, bucket_name) do |chunk|
            file.write chunk
            counter = counter + 1
            if counter == ((((most_recent.about["content-length"].to_f/10.0)/1048576)*100).truncate).to_i or ((((file.size.to_f)/(most_recent.about["content-length"].to_f))*100.0).truncate == 100)
              print "#{(((file.size.to_f)/(most_recent.about["content-length"].to_f))*100.0).truncate}% "
              counter = 0
            end

          end
      end

      puts "\nBackup of #{most_recent.key} complete"

    end
    
    if databases.length > 1
      puts "All backups complete"
    end

  end
end

