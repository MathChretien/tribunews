class AddPhotoToTribes < ActiveRecord::Migration[5.2]
  def change
    add_column :tribes, :photo, :string
  end
end
