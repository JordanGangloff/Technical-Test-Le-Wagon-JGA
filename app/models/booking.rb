class Booking < ApplicationRecord
  belongs_to :listing

  after_create_commit :create_first_check_in_mission
  after_create_commit :create_last_checkout_mission

  private

  def create_first_check_in_mission
    mission = Mission.new(listing_id: self.listing_id,
                          type_of_mission: 'first_check_in',
                          date: self.start_date,
                          price: self.listing.num_rooms * 10)
    mission.save
  end

  def create_last_checkout_mission
    last_checkout_mission = Mission.where(type_of_mission: 'last_check_out',
                                          date: self.end_date,
                                          listing_id: self.listing_id)
    if last_checkout_mission
    else
      mission = Mission.new(listing_id: self.listing_id, type_of_mission: 'first_check_in',
                            date: self.end_date,
                            price: self.listing.num_rooms * 10)
      mission.save
    end
  end
end
