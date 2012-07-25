class Hoodie < ActiveRecord::Base
  attr_accessible :color1, :color2, :size
  validates_presence_of :color1, :color2, :size
  
end
