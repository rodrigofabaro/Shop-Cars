class Image < ActiveRecord::Base

  belongs_to :imageble, :polymorphic => true


   has_attached_file :picture,
                     :styles => { :medium => "370x370>",
                                  :miniatura => "100x100>",
                                  :thumb => "250x250>" }


end

