class AddAttributesToTribes < ActiveRecord::Migration[5.2]
  def change
    add_column :tribes, :name, :string
    add_column :tribes, :address, :string
    add_column :tribes, :description, :string
    add_column :tribes, :subscribed_on, :date
    add_reference :tribes, :user, foreign_key: true
  end
end
