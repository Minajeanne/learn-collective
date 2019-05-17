class LessonsController < ApplicationController
   before_action :find_lesson, only: [:show, :edit, :update, :destroy]
   before_action :authenticate_user!, except: [:index, :show]

   def new
      @lesson = Lesson.new
   end

   def create
      binding.pry
      @lesson = Lesson.new(lesson_params)
      if @lesson.save
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
   end

   def destroy
   end

   private 
      def find_lesson
         @lesson = Lesson.find_by(id: params[:id])
      end

      def lesson_params
         params.require(:lesson).permit(:name, :category, :section)
      end
end

