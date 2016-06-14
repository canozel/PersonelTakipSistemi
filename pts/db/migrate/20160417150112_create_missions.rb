class CreateMissions < ActiveRecord::Migration
  def change
    create_table :missions do |t|
      t.integer :user_id
      t.integer :customer_id
      t.text  :description
      t.boolean :state
      t.string  :total_fees

      t.timestamps null: false
    end
  end
end
