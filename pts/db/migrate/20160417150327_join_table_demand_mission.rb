class JoinTableDemandMission < ActiveRecord::Migration
  def change
    create_join_table :demands, :missions do |t|
      # t.index [:demand_id, :mission_id]
      # t.index [:mission_id, :demand_id]
    end
  end
end
