class ContributionsController < ApplicationController
   before_action :authenticate_user!

   def create
      binding.pry
      user_id = current_user.id
      lesson_id = params[:lesson_id]
      @contribution = Contribution.new(user_id: user_id, lesson_id: lesson_id, content: contribution_params[:content])
      if @contribution.save
         binding.pry
         redirect_to lesson_path(lesson_id)
      else
         render :'/lessons/show'
      end
   end

   private
      def contribution_params
         params.require(:contribution).permit(:content)
      end
end