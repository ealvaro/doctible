Just recently, (03/2021), I was asked by Doctible's CTO to create a very simple, quick Ruby on Rails parser demonstrating knowledge of ETL skills. These are the project specs sent to me via email.


# Technical Interview: Ruby Test #
### Requirements
Write a Ruby library that reads the attached file (data.txt) and parses it into a Ruby Hash. The hash should be equal to the below data structure:
### Example:
{
  'host' => 'test.com',

  'server_id' => 55331,

  'cost' => 2.56,

  'user' => 'user',

  'verbose' => true,

  'test_mode' => true,

  'debug_mode' => false,

  'log_file_path' => '/tmp/logfile.log',

  'send_notifications' => true

}

### Communication
Your email response should attach these two files:

- config_parser_spec.rb - rspec file
- config_parser.rb - ruby library

### Assessment criteria
We will be looking for readability, extensibility and maintainability.
