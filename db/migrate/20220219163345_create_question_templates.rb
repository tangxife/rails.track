class CreateQuestionTemplates < ActiveRecord::Migration[7.0]
  def change
    create_table :question_templates do |t|
      t.belongs_to :organization, null: false, foreign_key: true
      t.belongs_to :reference_check, foreign_key: true
      t.string :title, limit: 256, null: false
      t.integer :language, limit: 1, null: false, default: 0

      t.timestamps
    end
  end
end
