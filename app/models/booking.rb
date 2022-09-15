class Booking < ApplicationRecord
  belongs_to :listing

  after_create_commit :create_first_check_in_mission
  after_create_commit :create_last_checkout_mission

  private

  def create_first_checkin_mission
    # Créer simultanément une mission avec type_of_mission first_checkin
    first_checkin_mission = Mission.new(
      listing_id: self.listing_id,
      type_of_mission: 'first_checkin',
      date: self.start_date,
      price: self.listing.num_rooms * 10
    )
    first_checkin_mission.save
  end

  def create_last_checkout_mission
    # Créer simultanément une mission avec type_of_mission last_checkout
    last_checkout_mission = Mission.new(
      listing_id: self.listing_id,
      type_of_mission: 'last_checkout',
      date: self.end_date,
      price: self.listing.num_rooms * 5
    )
    last_checkout_mission.save
  end
end
