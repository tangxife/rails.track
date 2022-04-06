class AddOrganizationIdToTag < ActiveRecord::Migration[7.0]
  def change
    change_table :tags do |t|
      # t.belongs_to :organization, foreign_key: true
      add_column :tags, :organization_id, :bigint, null: false
      add_foreign_key "tags", "organizations"
    end
  end
end
