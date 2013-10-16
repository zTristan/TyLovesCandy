module ApplicationHelper

  # this method will embed the code from the partial
  def render_video_thumbnail(video)
    render :partial => 'shared/video_thumb', :locals => { :video => video }
  end

  # this method will embed the code from the partial
  def render_photo_thumbnail(photo)
    render :partial => 'shared/photo_thumb', :locals => { :photo => photo }
  end

  def render_candies(upload)
    render :partial => 'shared/candies', :locals => { :upload => upload }
  end

  def quick_edit(upload, categories)
    render :partial => 'shared/quick_edit', :locals => { :upload => upload, :categories => categories }
  end

  
end
