class CandidateAddForeginKey < ActiveRecord::Migration[7.0]
  def change
    change_table :candidates do |t|
      # t.belongs_to :organization, foreign_key: true
      add_foreign_key "candidates", "organizations"
    end
  end
end
