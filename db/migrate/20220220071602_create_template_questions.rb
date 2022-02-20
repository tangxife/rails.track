class CreateTemplateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_join_table :question_templates, :questions, table_name: 'template_questions' do |t|
      t.index   %i[question_template_id question_id], unique: true, name: 'index_template_questions_on_template_id_and_question_id'
      t.index   :question_id
      t.integer :order

      t.timestamps
    end
  end
end
