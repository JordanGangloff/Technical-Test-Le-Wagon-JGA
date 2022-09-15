class ListingsController < ApplicationController
  before_action :set_listing, only: %i[show edit destroy]

  def new; end

  def create
    @listing = Listing.new(listing_params)
    if @listing.save
      redirect_to listings_path
    else
      render new_listing, status: :unprocessable_entity
    end
  end

  def index
    @listings = Listing.all
  end

  def show; end

  def edit; end

  def update
    @listing.update(listing_params)
    redirect_to listing_path(@listing)
  end

  def destroy
    @listing.destroy
  end

  private

  def listing_params
    params.require(:listing).permit(:num_rooms, :booking_id, :reservation_id)
  end

  def set_listing
    @listing = Listing.find(params[:id])
  end
end
