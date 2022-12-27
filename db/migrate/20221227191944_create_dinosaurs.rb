class CreateDinosaurs < ActiveRecord::Migration[7.0]
  def change
    create_table :dinosaurs do |t|
      t.string :name, null: false
      t.integer :species, null: false
      t.integer :diet, null: false
      t.references :cage, null: false, foreign_key: true

      t.timestamps
    end
  end
end
