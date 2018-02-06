class CreateParsedLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :parsed_logs do |t|
      t.string :name
      t.integer :data_type
      t.jsonb :parsed_data, default: {}
    end
  end
end
