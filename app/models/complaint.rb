class Complaint<ActiveRecord::Base
  include Geokit::Geocoders
  acts_as_copy_target

  def geocode
    GoogleGeocoder.geocode(house_number + house_street + "New York, NY" )
  end
end
