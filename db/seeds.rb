case Rails.env
  when "development"
    Complaint.copy_from "tmp/filtered.csv"
  when "production"
    Complaint.copy_from "tmp/filtered.csv"
end
