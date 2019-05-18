class Contribution < ActiveRecord::Base
   belongs_to :user
   belongs_to :lesson

   validates :content, presence: true

   def self.content_includes(word)
      
   end
end
