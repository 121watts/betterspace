class CreateComplaints < ActiveRecord::Migration
  def change
    create_table :complaints do |t|
      t.string :created_date
      t.string :closed_date
      t.string :agency
      t.string :agency_name
      t.string :complaint_type
      t.string :descriptor
      t.string :location_type
      t.string :zip
      t.string :address
      t.string :street_name
      t.string :address_type
      t.string :city
      t.string :status
      t.string :borough
      t.float :lat
      t.float :long
      t.string :location 
      t.timestamps
    end
  end
end
