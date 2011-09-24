require 'geokit'
class GeoSearchController < ApplicationController
  def search
    @title = "Search"

    origin = params[:origin]
    within = params[:within]

    @json = Post.within(within, :origin=>origin).to_gmaps4rails
    #render(:template=>'posts/index')
    respond_to do |format|
      format.html
      format.js
    end

  end

end
