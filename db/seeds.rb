
case Rails.env
when "development"
  Complaint.copy_from "tmp/complaints_mini.csv"
when "production"
  Complaint.copy_from "tmp/complaints.csv"
end
