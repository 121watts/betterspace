class Complaint<ActiveRecord::Base
  acts_as_copy_target

  def self.collection_cache_key
    "complaints-#{Complaint.count}"
  end
end
