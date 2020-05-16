class Route < ApplicationRecord
  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes
  validates :name, presence: true
  before_validation :set_name
  validate :stations_count
  #default_scope { order("created_at DESC") 

  private
  def set_name
    self.name = "#{railway_stations.first.title} - #{railway_stations.last.title}"
  end

  def stations_count
    if railway_stations.size < 2
      errors.add(:base, 'Route should be contain at least 2 stations')
    end
  end

end