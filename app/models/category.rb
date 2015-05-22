class Category < ActiveRecord::Base
	has_many :tweets, :dependent => :destroy
end
