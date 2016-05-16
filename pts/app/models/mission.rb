class Mission < ActiveRecord::Base
  belongs_to :customer, class_name: "Customer", foreign_key: "customer_id"
  belongs_to :user, class_name: "User", foreign_key: "user_id"
end
