class CreateCases < ActiveRecord::Migration
  def change
    create_table :cases, :id => false do |t|
      t.integer :attorney_id
      t.integer :issue_id
    end
  end
end
