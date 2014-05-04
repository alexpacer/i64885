class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.integer :victim_id
      t.string :detail
      t.integer :status
      t.timestamps
    end
  end
end
