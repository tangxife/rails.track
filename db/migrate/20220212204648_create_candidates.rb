class CreateCandidates < ActiveRecord::Migration[7.0]
  def change
    create_table :candidates do |t|
      t.string 'cid', limit: 30
      t.string 'name', null: false
      t.string 'email', null: false
      t.string 'area_code'
      t.string 'phone'
      t.string 'now_rog_name'
      t.string 'now_industry'
      t.string 'memo', limit: 1000
      t.bigint 'organization_id', null: false
      t.bigint 'user_id', null: false
      # todo limit 2 是限制的什么？
      t.integer 'language', limit: 2, default: 0, null: false
      # todo 为什么要加这两个 index，还有为什么要取个名字。为什么不给 name 加 index。
      t.index ['organization_id'], name: 'index_candidates_on_organization_id'
      t.index ['user_id'], name: 'index_candidates_on_user_id'
      t.datetime "deleted_at"
      t.timestamps
    end
  end
end
