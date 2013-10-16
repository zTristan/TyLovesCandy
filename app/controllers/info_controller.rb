class InfoController < ApplicationController

  def rankings
    @users = User.desc(:candy_count).limit(100)
  end

  def how_to_play
  end

end
