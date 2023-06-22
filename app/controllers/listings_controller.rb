class ListingsController < ApplicationController
  before_action :set_listing, only: %i[show update destroy]

  def index
    @listings = Listing.all
    render json: @listings, each_serializer: ListingsSerializer, adapter: :json
  end

  def show
    render json: @listing, serializer: ListingsSerializer, adapter: :json
  end

  def create
    @listing = Listing.new(listing_params)
    if @listing.save
      render json: @listing, serializer: ListingsSerializer, adapter: :json
    else
      render json: { error: "Unprocessable params" }, status: :unprocessable_entity
    end
  end

  def update
    @listing.num_rooms = listing_params[:num_rooms]
    if @listing.save
      render json: @listing, serializer: ListingsSerializer, adapter: :json
    else
      render json: { error: "Unprocessable params" }, status: :unprocessable_entity
    end
  end

  def destroy
    @listing.destroy
  end

  private

  def set_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:num_rooms)
  end
end
