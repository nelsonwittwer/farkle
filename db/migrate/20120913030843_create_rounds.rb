class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.string :name
      t.integer :points
      t.integer :iteration
      t.boolean :stay

      t.timestamps
    end
  end
end
