class AddAdditionalFieldsToRound < ActiveRecord::Migration
  def change
    add_column :rounds, :complete, :boolean
  end
end
