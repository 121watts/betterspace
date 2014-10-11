case Rails.env
  when "development"
    Complaint.copy_from "lib/data/filtered.csv"
  when "production"
    Complaint.copy_from "lib/data/filtered.csv"
end
