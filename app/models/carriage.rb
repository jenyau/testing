class Carriage < ApplicationRecord
  validates :number, :top_seats, :bottom_seats, presence: true
  belongs_to :train

  scope :economy, -> { where(type: "EconomyCarriage") }
  scope :coupe, -> { where(type: "CoupeCarraige") }
  scope :ordered, -> { order("number DESC")}
end
