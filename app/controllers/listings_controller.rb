class ListingsController < ApplicationController
  before_action :set_listing, only: %i[show edit]

  private

  def set_listing
    @listing = Listing.find(params[:id])
  end
end
