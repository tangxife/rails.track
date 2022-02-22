class CreateTemplateQuestion < ActiveRecord::Migration[7.0]
  def change
    create_table :template_questions do |t|
      t.belongs_to :question_template, foreign_key: true
      t.belongs_to :question, foreign_key: true
      t.index   %i[question_template_id question_id], unique: true, name: 'index_template_questions_on_template_id_and_question_id'
      t.integer :order

      t.timestamps
    end
  end
end
