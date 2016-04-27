class CreateDemands < ActiveRecord::Migration
  def change
    create_table :demands do |t|
      t.string :name
      t.string :fee

      t.timestamps null: false
    end
  end
end
