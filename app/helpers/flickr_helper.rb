module FlickrHelper
  def user_photos(user_id, photo_count = 12)
    flickr = Flickr.new(File.join(Rails.root, 'config', 'flickr.yml'))
    flickr.photos.search(:user_id => user_id).values_at(0..(photo_count - 1))
  end

  def render_flickr_sidebar_widget(user_id, photo_count = 12, columns = 2)
    begin
      photos = user_photos(user_id, photo_count).in_groups_of(4)
      render :partial => '/flickrs/sidebar_widget', :locals => { :photos => photos }
    rescue Exception
      render :partial => '/flickrs/unavailable', :locals => { :photos => photos }
    end
  end
end
