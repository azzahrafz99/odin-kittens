class FlickrsController < ApplicationController
  def show
    @photos = user_photos(params[:user_id])
  end
end
