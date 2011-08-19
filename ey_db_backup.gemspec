# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{ey_db_backup}
  s.version = "1.2.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Brett Chalupa"]
  s.date = %q{2011-08-19}
  s.default_executable = %q{ey_db_backup}
  s.description = %q{This gem interacts with Amazon's S3 service to give the user the ability to backup their Engine Yard databases and store them locally. This gem should allow the user to easily automate the process of grabbing the most recent database backup from S3. You can include as many databases in an environment as desired. To get started, check out the documentation.}
  s.email = %q{brettchalupa@gmail.com}
  s.executables = ["ey_db_backup"]
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".DS_Store",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "bin/ey_db_backup",
    "config/.DS_Store",
    "config/cucumber.yml",
    "ey_db_backup.gemspec",
    "features/.DS_Store",
    "features/export.feature",
    "features/step_definitions/.DS_Store",
    "features/step_definitions/db_export_steps.rb",
    "features/support/env.rb",
    "lib/ey_db_backup.rb",
    "lib/ey_db_backup/aws_configuration.rb",
    "lib/ey_db_backup/database_export.rb",
    "most_recent_backup",
    "most_recent_file",
    "pkg/Engine Yard Database Import-0.1.0.gem",
    "pkg/ey_db_backup-0.2.0.gem",
    "pkg/ey_db_import-0.1.0.gem",
    "pkg/ey_db_import-0.2.0.gem",
    "spec/ey_db_import_spec.rb",
    "spec/spec_helper.rb",
    "test/aww_yeah",
    "test/chellocat.jpg",
    "test/most_recent_backup",
    "tmp/mock-aws-s3/bucket/abc123",
    "tmp/mock-aws-s3/bucket/backup_db"
  ]
  s.homepage = %q{http://github.com/brettchalupa/ey_db_backup}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{Gem interacts with Amazon's S3 service to import the latest database backup.}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<thor>, [">= 0"])
      s.add_runtime_dependency(%q<aws-s3>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.3.0"])
      s.add_development_dependency(%q<cucumber>, [">= 0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.6.4"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
      s.add_development_dependency(%q<mock-aws-s3>, [">= 0"])
      s.add_development_dependency(%q<aws-s3>, [">= 0"])
    else
      s.add_dependency(%q<thor>, [">= 0"])
      s.add_dependency(%q<aws-s3>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 2.3.0"])
      s.add_dependency(%q<cucumber>, [">= 0"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.6.4"])
      s.add_dependency(%q<rcov>, [">= 0"])
      s.add_dependency(%q<mock-aws-s3>, [">= 0"])
      s.add_dependency(%q<aws-s3>, [">= 0"])
    end
  else
    s.add_dependency(%q<thor>, [">= 0"])
    s.add_dependency(%q<aws-s3>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 2.3.0"])
    s.add_dependency(%q<cucumber>, [">= 0"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.6.4"])
    s.add_dependency(%q<rcov>, [">= 0"])
    s.add_dependency(%q<mock-aws-s3>, [">= 0"])
    s.add_dependency(%q<aws-s3>, [">= 0"])
  end
end

