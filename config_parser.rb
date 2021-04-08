# This class parses the external and generates a hash with the information

# frozen_string_literal: true

# Class with the parse(filename) public method
class ConfigParser
  FALSE_VALUES = [false, 'false', 'off', 'no'].freeze
  TRUE_VALUES = [true, 'true', 'on', 'yes'].freeze

  def self.parse(file_name)
    file_data = {}
    File.open(file_name, 'r').each_line do |line|
      next if line[0] == '#'      # ignore comments

      line_data = line.split('=') # break line into key and value
      file_data[line_data[0].strip] = format_types(line_data[1].strip) # get rid of spaces and \n and format output
    end
    file_data
  end

  # Converts strings into its correct data type depending on values
  def self.format_types(str)
    return true if TRUE_VALUES.include? str.downcase
    return false if FALSE_VALUES.include? str.downcase
    return str.to_f if (str.to_f % 1).positive?
    return str.to_i if str.to_i.to_s == str

    str
  end
end
