class Lesson < ApplicationRecord
   has_many :contributions
   has_many :users, through: :contributions

   validates_presence_of :name, :creator_id

   def clean_name
      self.name.gsub("-", " ")
   end
end
 