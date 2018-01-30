class ParsedLog < ApplicationRecord

  enum data_type: [:hashrates, :temperatures]

end
