class CreateReferenceChecks < ActiveRecord::Migration[7.0]
  def change
    create_table :reference_checks do |t|
      t.belongs_to :candidate, foreign_key: true
      t.belongs_to :user, foreign_key: true
      # default: 0 没有起作用。todo
      t.integer :progress, limit: 2, default: 0
      t.date :answer_deadline, null: false
      t.timestamps
    end
  end
end
