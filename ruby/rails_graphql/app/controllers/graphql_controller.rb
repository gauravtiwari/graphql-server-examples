class GraphqlController < ApplicationController

  def create
    result = Schema.execute(
      params[:query],
      variables: params[:variables]
    )
    render json: result
  end
end
