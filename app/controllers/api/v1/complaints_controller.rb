class Api::V1::ComplaintsController<ApplicationController
  respond_to :json

  before_action :authenticate

  def index
    @complaints = Complaint.limit(1000)
    respond_with @complaints, each_serializer: Api::V1::ComplaintSerializer
  end

  def show
    @complaint = Complaint.find(params[:id])
    respond_with @complaint, each_serializer: Api::V1::ComplaintSerializer
  end

  private

  def authenticate
    authenticate_or_request_with_http_token do |token|
       ApiKey.exists?(token: token)
    end
  end
end
