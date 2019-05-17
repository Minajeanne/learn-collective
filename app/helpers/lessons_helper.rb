module LessonsHelper
   def current_user_is_creator?(lesson)
      !!(lesson.creator_id == current_user.id)
   end   
end