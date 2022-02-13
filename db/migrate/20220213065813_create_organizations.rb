class CreateOrganizations < ActiveRecord::Migration[7.0]
  def change
    create_table :organizations do |t|
      t.string :name, null: false, index: {unique: true}
      t.string :email
      t.string :tel
      t.string :postal_code
      t.string :address
      t.string :contacts
      t.timestamps
    end
  end
end
