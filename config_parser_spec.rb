# This class will test the config_parser class
# frozen_string_literal: true

require_relative 'config_parser'
RSpec.describe ConfigParser do
  describe '.parse' do
    context 'when parse is called on data.txt' do
      let(:file) { 'data.txt' }

      it 'returns the provided data.txt file as a Hash' do
        expect(ConfigParser.parse(file)).to eq(
          { 'host' => 'test.com',
            'server_id' => 55_331,
            'cost' => 2.56,
            'user' => 'user',
            'verbose' => true,
            'test_mode' => true,
            'debug_mode' => false,
            'log_file_path' => '/tmp/logfile.log',
            'send_notifications' => true }
        )
      end
    end
  end

  describe '.format_types' do
    context 'when different data types are converted' do
      it 'tests for true values' do
        expect(ConfigParser.send(:format_types, 'on')).to eq(true)
        expect(ConfigParser.send(:format_types, 'True')).to eq(true)
        expect(ConfigParser.send(:format_types, 'YES')).to eq(true)
      end

      it 'tests for false values' do
        expect(ConfigParser.send(:format_types, 'Off')).to eq(false)
        expect(ConfigParser.send(:format_types, 'false')).to eq(false)
        expect(ConfigParser.send(:format_types, 'No')).to eq(false)
      end

      it 'tests for floating values' do
        expect(ConfigParser.send(:format_types, '123.45')).to eq(123.45)
        expect(ConfigParser.send(:format_types, '0.0333')).to eq(0.0333)
      end

      it 'tests for integer values' do
        expect(ConfigParser.send(:format_types, '12345')).to eq(12_345)
        expect(ConfigParser.send(:format_types, '-3467')).to eq(-3467)
      end
    end
  end
end
