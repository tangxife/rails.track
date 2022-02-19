class QuestionTemplatesRemoveReferenceCheckId < ActiveRecord::Migration[7.0]
  def change
    remove_column :question_templates, :reference_check_id
  end
end
