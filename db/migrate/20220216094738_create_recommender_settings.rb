class CreateRecommenderSettings < ActiveRecord::Migration[7.0]
  def change
    create_table :recommender_settings do |t|
      # t.belongs_to :candidate, foreign_key: true
      t.belongs_to :reference_check, foreign_key: true
      t.integer :relation, limit: 2
      t.integer :period, limit: 2
      t.integer :num, limit: 2
      
      t.timestamps
    end
  end
end
