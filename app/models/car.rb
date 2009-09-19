class Car < ActiveRecord::Base

  has_many  :images, :as => :imageble, :class_name => '::Image', :dependent => :destroy

end

