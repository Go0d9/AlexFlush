class Tweet < ActiveRecord::Base
	has_many :comments, :dependent => :destroy # уничтожать вместе с основным экземпляром
	belongs_to :category
	 
	# валидация
	validates :title, :presence => true
	validates :title, :uniqueness => true
	validates :title, :length => { :maximum => 150 }
	validates :text, :length => { :maximum => 2000 } 
end
