class CreateAttorneys < ActiveRecord::Migration
  def change
    create_table :attorneys do |t|
      t.string :name
      t.json :contact
      t.json :location
      t.json :tags

      t.timestamps
    end
  end
end
