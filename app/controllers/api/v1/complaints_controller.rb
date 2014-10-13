class Api::V1::ComplaintsController<ApplicationController
  respond_to :json

  before_action :authenticate, except: [:index]

  def index
    if Rails.cache.exist?(Complaint.collection_cache_key)
      complaints = Rails.cache.read(Complaint.collection_cache_key)
    else
      complaints = ActiveModel::ArraySerializer.new(Complaint.all, each_serializer: Api::V1::ComplaintSerializer).to_json
      Rails.cache.write(Complaint.collection_cache_key, complaints)
    end
    render json: complaints
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
