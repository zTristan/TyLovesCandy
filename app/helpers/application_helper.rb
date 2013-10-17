module ApplicationHelper

  def render_video_thumbnail(video)
    render :partial => 'shared/video_thumb', :locals => { :video => video }
  end

  def render_photo_thumbnail(photo)
    render :partial => 'shared/photo_thumb', :locals => { :photo => photo }
  end

  def render_candies(upload)
    render :partial => 'shared/candies', :locals => { :upload => upload }
  end

  def quick_edit(upload, categories)
    render :partial => 'shared/quick_edit', :locals => { :upload => upload, :categories => categories }
  end

  def render_comments(upload)
    render :partial => 'shared/comments', :locals => { :upload => upload }
  end
  
end
