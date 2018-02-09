class AddFileToParsedLogs < ActiveRecord::Migration[5.1]
  def change
    add_column :parsed_logs, :file, :string
  end
end
