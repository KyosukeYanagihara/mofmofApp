class RenameNameColumnToStations < ActiveRecord::Migration[5.2]
  def change
    rename_column :stations, :name, :station_name
  end
end
