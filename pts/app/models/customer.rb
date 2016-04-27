class Customer < ActiveRecord::Base
	has_many :missions
	accepts_nested_attributes_for :missions	
end
