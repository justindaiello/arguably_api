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

  def delete
    render json: Poll.delete(params["id"])
  end

end
