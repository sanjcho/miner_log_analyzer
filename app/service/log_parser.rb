class LogParser

  def initialize file
    @file = file
  end

  def parse_hashrates
    parsed_log = ParsedLog.find_or_create_by(data_type: :hashrates, name: "test")
    parsed_data = {}
    File.readlines(@file).each do |line|
      if (line =~ /ETH:\sGPU0\s[0-9,\.]{6}\sMh\/s/)
        time = Time.parse line[0..11]
        parsed_data = line.scan(/GPU[0-9]+/).inject({}) {|memo, val| memo[val] = {}; memo} if parsed_data.empty?
        rates_arr = line.scan(/[0-9+.]{6}/)
        parsed_data = line.scan(/GPU[0-9]+/).each_with_index.inject(parsed_data) do |memo, (gpu, i)|
          memo[gpu].merge!({time => rates_arr[i]})
          memo
        end
      end
    end
    parsed_log.update(parsed_data: parsed_data)
  end

end
