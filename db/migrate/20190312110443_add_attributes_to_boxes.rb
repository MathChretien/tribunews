class AddAttributesToBoxes < ActiveRecord::Migration[5.2]
  def change
    add_column :boxes, :content_text, :text
    add_column :boxes, :category, :string
  end
end
