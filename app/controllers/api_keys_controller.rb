class ApiKeysController < ApplicationController

  before_action :authorize

  def index
    @api_keys = current_user.api_keys
  end

  def create
    current_user.api_keys.create(token: SecureRandom.hex)

    redirect_to api_keys_path, notice: "You API Key has been created."
  end

  def destroy
    current_user.api_keys.find(params[:id]).destroy

    redirect_to api_keys_path, notice: "Your API Key has been deleted."
  end
end
