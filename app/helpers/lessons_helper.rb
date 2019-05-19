module LessonsHelper  
   def display_user(content)
      if !!content.user
         content.user.username
      else
         "Unkown Source"
      end
   end
end