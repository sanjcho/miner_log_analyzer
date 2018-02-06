class ParsedLog < ApplicationRecord

  enum data_type: [:hashrates, :temperatures]
  serialize :parsed_data
end
