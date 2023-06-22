class MissionsController < ApplicationController
  def index
    @missions = Mission.all.order(:listing_id)
    render json: @missions, each_serializer: MissionsSerializer, adapter: :json
  end
end
