class Car < ActiveRecord::Base

  has_many  :images, :as => :imageble, :class_name => '::Image'

end

