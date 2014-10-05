include Geokit::Geocoders

namespace :complaints do
  desc  "generates lat long for complaints object"
  task :populate do
    puts "populating lat long for complaints.."
    complaints = Complaint.all[11..2000]
    complaints.each do |complaint|
      sleep(0.5)
      lat = GoogleGeocoder.geocode(complaint.house_number + complaint.house_street + "New York, NY" ).lat
      long = GoogleGeocoder.geocode(complaint.house_number + complaint.house_street + "New York, NY" ).lng
      complaint.lat  = lat
      complaint.long = long
      complaint.save
    end
  end
end
