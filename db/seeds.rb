case Rails.env
  when "development"
    Complaint.copy_from "tmp/complaints_dev.csv"
  when "production"
    Complaint.copy_from "tmp/complaints.csv"
end
