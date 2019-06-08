class PollsController < ApplicationController

  def index
    render json: Poll.all
  end

  def show
    render json: Poll.find(params["id"])
  end

  def create
    render json: Poll.create(params["poll"])
  end

end
