class ContributionsController < ApplicationController
   def create
      binding.pry
      user_id = current_user.user_id
   end

   private
      def contribution_params
         params.require(:contribution).permit(:lesson_id, :content)
      end
end