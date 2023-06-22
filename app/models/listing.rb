class Listing < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many :missions, dependent: :destroy

  validates :num_rooms, numericality: { only_integer: true }

  after_update :update_missions

  private

  def update_missions
    missions.each do |mission|
      mission.price = 10 * num_rooms if mission.mission_type == "first_checkin"
      mission.price = 10 * num_rooms if mission.mission_type == "checkout_checkin"
      mission.price = 5 * num_rooms if mission.mission_type == "last_checkout"
      mission.save
    end
  end
end
