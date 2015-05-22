class AddColumnsToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :category_id, :string
  end
end
