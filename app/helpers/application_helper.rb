module ApplicationHelper

  # this method will embed the code from the partial
  def show_video(video, size="flowplayer_large")
    render :partial => 'shared/video', :locals => { :video => video, :size_class => size }
  end

  def quick_edit(upload)
    render :partial => 'shared/quick_edit', :locals => { :upload => upload }
  end
  
end
