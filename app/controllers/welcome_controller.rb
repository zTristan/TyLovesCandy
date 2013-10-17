class WelcomeController < ApplicationController

  def index
    @top_categories = Category.in(:name => ["Tyler and Candace", "On The Dance Floor", "The Kissing Booth"])
  end

end
