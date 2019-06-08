class PollsController < ApplicationController

  def index
    render json: Poll.all
  end

end
