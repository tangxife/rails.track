class CreateTags < ActiveRecord::Migration[7.0]
  def change
    create_table :tags do |t|
      t.string :title, limit: 32, index: true, null: false
      t.timestamps
    end
  end
end
