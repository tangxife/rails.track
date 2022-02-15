class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.belongs_to :organization, foreign_key: true
      t.string  :name
      t.string  :email
      t.string  :phone
      t.string  :department
      t.integer :role, null: false, limit: 1
      t.timestamps
    end
  end
end
