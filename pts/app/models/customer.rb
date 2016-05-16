class Customer < ActiveRecord::Base
	has_many :missions
	accepts_nested_attributes_for :missions	

  def full_name
    first_name.to_s + " " + last_name.to_s
  end
end
