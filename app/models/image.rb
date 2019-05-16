class Image < ApplicationRecord
   include ImageUploader[:image_link]
end
