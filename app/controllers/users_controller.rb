class UsersController < ApplicationController
   before_action :authenticate_user!

   def show
      @user = current_user
      @contributions = @user.contributions.reverse
   end
end