class CreateVictims < ActiveRecord::Migration
  def change
    create_table :victims do |t|
      t.string :name
      t.json :contact
      t.json :location

      t.timestamps
    end
  end
end
