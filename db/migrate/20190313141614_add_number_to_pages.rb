class AddNumberToPages < ActiveRecord::Migration[5.2]
  def change
    add_column :pages, :number, :string
  end
end
