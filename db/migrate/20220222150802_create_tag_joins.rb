class CreateTagJoins < ActiveRecord::Migration[7.0]
  def change
    create_table :tag_joins do |t|
      t.references :tagable, polymorphic: true, index: true
      t.belongs_to :tag
      t.timestamps
    end
  end
end
