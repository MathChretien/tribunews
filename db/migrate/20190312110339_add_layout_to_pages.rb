class AddLayoutToPages < ActiveRecord::Migration[5.2]
  def change
    add_column :pages, :layout, :string
  end
end
