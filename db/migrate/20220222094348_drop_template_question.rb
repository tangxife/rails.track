class DropTemplateQuestion < ActiveRecord::Migration[7.0]
  def change
    drop_table :template_questions
  end
end
