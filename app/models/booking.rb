class Booking < ApplicationRecord
  belongs_to :listing

  after_create :create_missions

  private

  def create_missions
    Mission.create(
      mission_type: "first_checkin",
      date: start_date,
      price: 10 * listing.num_rooms
    )

    Mission.create(
      mission_type: "last_checkout",
      date: end_date,
      price: 5 * listing.num_rooms
    )
  end
end
