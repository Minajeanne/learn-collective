class ApplicationController < ActionController::Base
   layout "landing", only: :home
   def home
      redirect_to lessons_path if user_signed_in?
   end
end
