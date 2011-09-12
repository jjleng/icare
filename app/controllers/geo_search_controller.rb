require 'geokit'
class GeoSearchController < ApplicationController
  def search
    @title = "Search"

    origin = params[:origin]
    within = params[:within]

    @json = Post.within(within, :origin=>origin).to_gmaps4rails
    #render(:template=>'posts/index')

  end

  def show
  end

end
