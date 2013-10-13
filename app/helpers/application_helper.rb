module ApplicationHelper

  # this method will embed the code from the partial
  def show_video(video)
    render :partial => 'shared/video', :locals => { :video => video }
  end 
  
end
