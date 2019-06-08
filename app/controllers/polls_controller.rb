class PollsController < ApplicationController

  def index
    render json: Poll.all
  end

  def show
    render json: Poll.find(params["id"])
  end

end
