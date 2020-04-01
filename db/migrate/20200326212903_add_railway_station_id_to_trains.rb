class AddRailwayStationIdToTrains < ActiveRecord::Migration[6.0]
  def change
    add_belongs_to :trains, :railway_station
  end
end
