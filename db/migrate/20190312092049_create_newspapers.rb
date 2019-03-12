class CreateNewspapers < ActiveRecord::Migration[5.2]
  def change
    create_table :newspapers do |t|
      t.references :tribe, foreign_key: true

      t.timestamps
    end
  end
end
