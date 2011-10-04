require 'sunspot_rails'

class Post < ActiveRecord::Base
  validates :title, :presence => true


  acts_as_gmappable :validation => false

  acts_as_mappable :default_units => :miles,
                   :default_formula => :sphere,
                   :distance_field_name => :distance,
                   :lat_column_name => :latitude,
                   :lng_column_name => :longitude

  has_many :assets, :dependent => :destroy
  accepts_nested_attributes_for :assets

  searchable do
    text :title, :content, :location
  end

  before_save :extract_city

  def gmaps4rails_address
    location
  end

  def gmaps4rails_infowindow
    if self.assets && self.assets.first && self.assets.first.image
      picture = self.assets.first.image.url(:thumb)
    end
    "#{title} <br> <p> <img src='#{picture}'> </p>"
  end

  #def gmaps4rails_marker_picture
  #  if self.assets && self.assets.first && self.assets.first.image
  #    picture = self.assets.first.image.url(:thumb)
  #  end
  #  {
  #      "picture" => picture, # string, mandatory
  #      "width" => "25", # string, mandatory
  #      "height" => "25" # string, mandatory
  #  }
  #end

  private

  def extract_city
    self.city ||= GeoKit::Geocoders::GoogleGeocoder.geocode(location).city
  rescue

  end

end
