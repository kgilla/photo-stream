class PagesController < ApplicationController
  def feed
    f = Flickr.new ENV['flickr_key'], ENV['flickr_secret']
    user = f.people.findByUsername(username: params[:user])
    if user
      @photos = f.people.getPublicPhotos(user_id: user.id)
    end
  end
end
