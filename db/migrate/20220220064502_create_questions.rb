class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.belongs_to :organization,    foreign_key: true, null: false
      t.string     :title,           limit:       1000, null: false
      t.string     :purpose,         limit:       1000
      t.string     :answer_example0, limit:       1000
      t.string     :answer_example1, limit:       1000
      t.boolean    :is_recommended,  default:     false
      t.string     :type,            null:        false

      t.timestamps
    end
  end
end
