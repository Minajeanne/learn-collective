class LessonsController < ApplicationController
   before_action :find_lesson, only: :show

   def index
      @lessons = Lesson.all
   end

   def show
      @contribution = Contribution.new
   end

   private 
      def find_lesson
         @lesson = Lesson.find_by(id: params[:id])
      end
end

