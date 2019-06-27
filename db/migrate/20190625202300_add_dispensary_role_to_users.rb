class AddDispensaryRoleToUsers < ActiveRecord::Migration[5.2]
  def change
      add_column :users, :dispensary, :boolean, default: false
      add_column :users, :dispensaryTAC, :boolean, default: false
  end
end
