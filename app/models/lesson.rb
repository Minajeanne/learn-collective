class Lesson < ApplicationRecord
   has_many :contributions
   has_many :users, through: :contributions

   validates_presence_of :name, :creator_id

   def clean_name
      name.gsub("-", " ")
   end

   def creator_is?(user)
      !!(self.creator_id == user.id) unless user.nil?
   end 
end
 