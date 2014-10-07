class ComplaintsController<ApplicationController
  
  def index
    @complaints = Complaint.limit(100)
  end

end
