class GraphqlController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    result = Schema.execute(
      params[:query],
      variables: params[:variables]
    )
    render json: result
  end
end
