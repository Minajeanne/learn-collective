class ApplicationController < ActionController::Base
   layout "landing", only: :home
   def home
   end
end
