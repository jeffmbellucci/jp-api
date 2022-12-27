class CreateCages < ActiveRecord::Migration[7.0]
  def change
    create_table :cages do |t|
      t.integer :power_status, default: 0
      t.integer :capacity, null: false

      t.timestamps
    end
  end
end
