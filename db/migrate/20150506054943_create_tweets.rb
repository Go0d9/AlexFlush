class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string  :title
      t.text  :text
      t.string  :user_id
      t.timestamps null: false
    end
  end
end
