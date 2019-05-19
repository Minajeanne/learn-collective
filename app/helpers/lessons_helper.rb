module LessonsHelper  
   def display_user(content)
      if !!content.user
         content.user.username
      else
         "Unknown Source"
      end
   end
end