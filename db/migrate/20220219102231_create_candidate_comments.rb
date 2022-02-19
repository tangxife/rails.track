class CreateCandidateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :candidate_comments do |t|
      t.belongs_to :candidate, foregin_key: true
      t.belongs_to :user, foregin_key: true
      t.string :content, litmit: 300, null: false

      t.timestamps
    end
  end
end
