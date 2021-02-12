class CreateStations < ActiveRecord::Migration[5.2]
  def change
    create_table :stations do |t|
      t.string :route_name
      t.string :name
      t.integer :access
      t.references :property, foreign_key: true

      t.timestamps
    end
  end
end
