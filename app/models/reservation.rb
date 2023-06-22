class Reservation < ApplicationRecord
  belongs_to :listing

  after_create :create_mission

  private

  def create_mission
    return if listing.missions.where(mission_type: "last_checkout", date: end_date).exists?

    Mission.create!(
      listing: listing,
      mission_type: "checkout_checkin",
      date: start_date,
      price: 10 * listing.num_rooms
    )
  end
end
