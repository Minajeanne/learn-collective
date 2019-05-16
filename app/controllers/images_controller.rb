class ImagesController < ApplicationController


   private
      def image_params
         params.require(:image).permit(:image_link)
      end
end