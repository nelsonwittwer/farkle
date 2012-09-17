class CreateTurns < ActiveRecord::Migration
  def change
    create_table :turns do |t|
      t.integer :total_points

      t.timestamps
    end
  end
end
