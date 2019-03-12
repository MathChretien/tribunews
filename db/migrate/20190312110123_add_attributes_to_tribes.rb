class AddAttributesToTribes < ActiveRecord::Migration[5.2]
  def change
    add_column :tribes, :name, :string
    add_column :tribes, :address, :string
    add_column :tribes, :description, :string
    add_column :tribes, :subscribed_on, :date
  end
end
