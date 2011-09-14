class Post < ActiveRecord::Base
  acts_as_gmappable
  acts_as_mappable :default_units => :miles,
                   :default_formula => :sphere,
                   :distance_field_name => :distance,
                   :lat_column_name => :latitude,
                   :lng_column_name => :longitude
  has_many :assets, :dependent => :destroy
  accepts_nested_attributes_for :assets

  def gmaps4rails_address
    location
  end
end
