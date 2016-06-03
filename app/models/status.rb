class Status < ActiveRecord::Base
  belongs_to :friend , :class_name => "Friend", :foreign_key => "friend_id" 
end
