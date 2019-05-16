class ContributionsController < ApplicationController
   before_action :authenticate_user!
   before_action :find_contribution, only: [:edit, :update, :destroy]

   def create
      lesson = Lesson.find_by(id: params[:lesson_id])
      @contribution = Contribution.new(user: current_user, lesson: lesson, content: contribution_params[:content])
      if @contribution.save
         redirect_to lesson_path(lesson)
      else
         redirect_to lesson_path(lesson), alert: "Content was empty."
      end
   end

   def edit
   end

   def update
      if @contribution.update(contribution_params)
         redirect_to lesson_path(@contribution.lesson)
      else
         render :edit
      end
   end

   def destroy
      @lesson = @contribution.lesson
      @contribution.destroy
      redirect_to lesson_path(@lesson), notice: "Contribution deleted"
   end

   private
      def contribution_params
         params.require(:contribution).permit(:content)
      end

      def find_contribution
         @contribution = Contribution.find_by(id: params[:id])
      end
end