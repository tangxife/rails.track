class ReferenecCheckAddQuestionTemplateId < ActiveRecord::Migration[7.0]
  def change
    add_column :reference_checks, :question_template_id, :integer, foreign_key: true, null: true
  end
end
