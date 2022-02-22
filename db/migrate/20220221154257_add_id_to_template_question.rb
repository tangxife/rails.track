class AddIdToTemplateQuestion < ActiveRecord::Migration[7.0]
  def change
    add_column :template_questions, :id, :bigint, primary_key: true, null: false
  end
end
