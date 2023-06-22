class MissionsSerializer < ActiveModel::Serializer
  attributes :listing_id, :mission_type, :date, :price
end
