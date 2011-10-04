require 'geokit'
class GeoSearchController < ApplicationController
  def search
    @title = "Search"

    origin = params[:origin]
    within = params[:within]

    if (!origin.empty? && !within.empty?)
      @json = Post.within(within, :origin=>origin).to_gmaps4rails
    else
      @json = Post.within(0, :origin=>"origin").to_gmaps4rails
    end

    #render(:template=>'posts/index')
    respond_to do |format|
      format.html
      format.js
    end

  end

end
