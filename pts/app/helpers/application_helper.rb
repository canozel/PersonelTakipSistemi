module ApplicationHelper
  def verified_request?
    User.find(params[:id].to_i).authentication_token == params[:auth_token]
  end
end
