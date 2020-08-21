class StaticPagesController < ApplicationController
  require 'flickr'

  def home
    if params[:user_id]
      @user_id = params[:user_id]
      flickr = Flickr.new(ENV['FLICKR_API_KEY'], ENV['FLICKR_SHARED_SECRET'])
      
      @photos = flickr.people.getPublicPhotos(user_id: @user_id)
    end
  end
end
