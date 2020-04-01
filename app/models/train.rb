class Train < ActiveRecord::Base
    validates :number, presence: true
    belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :railway_station_id
end