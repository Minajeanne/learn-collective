class AddCreatorIdToLessons < ActiveRecord::Migration[5.2]
  def change
    add_column :lessons, :creator_id, :integer
  end
end
