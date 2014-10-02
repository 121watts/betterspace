class AddComplaints < ActiveRecord::Migration
  def change
    create_table :complaints do |t|
      t.string :complaint_number
      t.string :status
      t.string :date_entered
      t.string :house_number
      t.string :house_street
      t.string :inspection_date

      t.timestamps
    end
  end
end
