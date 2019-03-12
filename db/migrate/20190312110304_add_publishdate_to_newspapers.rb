class AddPublishdateToNewspapers < ActiveRecord::Migration[5.2]
  def change
    add_column :newspapers, :published_on, :date
  end
end
