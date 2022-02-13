class RenameColumnNowRogNameToNowOrgName < ActiveRecord::Migration[7.0]
  def change
    rename_column :candidates, :now_rog_name, :now_org_name
  end
end
