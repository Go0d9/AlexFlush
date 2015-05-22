class DropTable < ActiveRecord::Migration
  def change
  	drop_table :tweets
  	drop_table :categories
  	drop_table :tweet_categories
  end
end
