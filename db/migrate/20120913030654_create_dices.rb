class CreateDices < ActiveRecord::Migration
  def change
    create_table :dices do |t|
      t.integer :value

      t.timestamps
    end
  end
end
