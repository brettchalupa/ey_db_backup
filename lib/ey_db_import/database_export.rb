require 'aws/s3'
require 'thor'

class DatabaseExport < Thor
  include Thor::Actions

  def run_export(bucket_name, export_path)
    bucket_files = AWS::S3::Bucket.objects('bc_images')
    
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

