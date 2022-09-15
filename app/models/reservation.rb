class Reservation < ApplicationRecord
  belongs_to :listing

  def possible?
    Reservation.start_date <= Booking.start_date && Reservation.end_date <= Booking.end_date
  end
end
