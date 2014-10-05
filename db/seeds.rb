case Rails.env
  when "development"
    Complaint.copy_from "tmp/sexy_complaints.csv"
  when "production"
    Complaint.copy_from "tmp/sexy_complaints.csv"
end
