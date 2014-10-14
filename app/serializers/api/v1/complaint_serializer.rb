class Api::V1::ComplaintSerializer<ActiveModel::Serializer
  attributes :lat, :long, :descriptor, :address
  cached
end
