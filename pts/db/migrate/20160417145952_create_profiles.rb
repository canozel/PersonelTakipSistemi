class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.string :date_of_birth
      t.string :score
      t.string :location

      t.timestamps null: false
    end
  end
end
