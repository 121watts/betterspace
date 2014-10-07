class Api::V1::ComplaintsController<ApplicationController
  respond_to :json

  def index
    @complaints = Complaint.limit(10000)
    respond_with @complaints, each_serializer: Api::V1::ComplaintSerializer
  end
end
