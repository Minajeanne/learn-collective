class Lesson < ApplicationRecord
   has_many :contributions
   has_many :users, through: :contributions

   validates :name, presence: true

   def clean_name
      self.name.gsub("-", " ")
   end
end
