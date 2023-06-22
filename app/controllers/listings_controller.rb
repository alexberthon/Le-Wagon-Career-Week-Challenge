# require "./app/serializers/listings_serializer"

class ListingsController < ApplicationController
  before_action :set_listing, only: %i[show update delete]

  def index
    @listings = Listing.all
    render json: @listings, each_serializer: ListingsSerializer, adapter: :json
  end

  def show
    render json: @listing, serializer: ListingsSerializer
  end

  private

  def set_listing
    @listing = Listing.find(params[:id])
  end
end
