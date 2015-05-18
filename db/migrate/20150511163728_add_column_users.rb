class AddColumnUsers < ActiveRecord::Migration
  def up
    add_column :users, :admin, :boolean, null:false, default:false
  end
end
