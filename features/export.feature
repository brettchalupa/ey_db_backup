Feature: Exporting database from Engine Yard
  As a developer
  I want to export the latest database from Engine Yard
  So that I have a backup of the database hosted on another server that isn't Amazon's S3
  
  Scenario: Successfully downloading the database
    Given I have Amazon S3 credentials located in a file
    And I have a database backup on Amazon S3
    When I run the script to export the database
    Then I should have successfully exported the database to my local directory
