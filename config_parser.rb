require 'json'

class ConfigParser

  FALSE_VALUES = [false, 0, "0", "f", "false", "off", "no"]
  TRUE_VALUES = [true, 1, "1", "t", "true", "on", "yes"]

  def self.parse(file_name)
    file_data = {}
    File.open(file_name, 'r') do |file|
      file.each_line do |line|
        if line[0] != '#' then                                       #ignore comments
          line_data = line.split('=')                                #break line into key and value
          file_data[line_data[0]] = format_types(line_data[1].strip) #get rid of spaces and \n and format output
        end
      end
    end
    return file_data
  end

  private

  # Converts strings into its correct data type depending on values
  def self.format_types(str)
    return true if TRUE_VALUES.include? str.downcase
    return false if FALSE_VALUES.include? str.downcase
    return str.to_f if (str.to_f % 1) > 0
    return str.to_i if str.to_i.to_s == str
    return str
  end

end
