class AddExtraColumnsToComplaints < ActiveRecord::Migration
  def change
    add_column :complaints, :bin, :string
    add_column :complaints, :community_board, :string
    add_column :complaints, :special_district, :string
    add_column :complaints, :complaint_category, :string
    add_column :complaints, :unit, :string
    add_column :complaints, :disposition_date, :string
    add_column :complaints, :disposition_code, :string
    add_column :complaints, :dob_run_date, :string
  end
end
