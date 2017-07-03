class FlickrsController < ApplicationController
  def show
    begin
			@photos = user_photos(params[:user_id])
		rescue
	  	render :partial => '/flickrs/unavailable'
		end
  end
end
