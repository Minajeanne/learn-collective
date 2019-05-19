class LessonsController < ApplicationController
   include LessonsHelper
   before_action :find_lesson, only: [:show, :edit, :update, :destroy]
   before_action :authenticate_user!, except: [:index, :show]
   before_action :check_creator, only: [:edit, :update, :destroy]

   def new
      @lesson = Lesson.new
   end

   def create
      @lesson = Lesson.new(lesson_params) do |user|
         user.creator_id = current_user.id
      end

      if @lesson.save
         binding.pry
         redirect_to lesson_path(@lesson), notice: "Lesson create!"
      else
         render :new
      end
   end

   def index
      @lessons = Lesson.all
   end

   def show
      @contribution = Contribution.new
   end

   def edit

   end

   def update
      if @lesson.update(lesson_params)
         redirect_to lesson_path(@lesson)
      else
         render :edit
      end
   end

   def destroy
      contributions = Contribution.where(lesson_id: @lesson.id)
      contributions.destroy_all
      @lesson.destroy
      redirect_to lessons_path, notice: "Lesson deleted"
   end

   private 
      def find_lesson
         @lesson = Lesson.find_by(id: params[:id])
      end

      def lesson_params
         params.require(:lesson).permit(:name, :category, :section)
      end

      def check_creator
         if @lesson.creator_is?(current_user)
            return
         else
            redirect_to lessons_path, alert: "You are not permitted to modify this #{@lesson.name}."
         end
      end
end

