class CreatePlants < ActiveRecord::Migration[6.0]
  def change
    create_table :plants do |t|
      t.string :name
      t.decimal :price
      t.string :img_url

      t.timestamps
    end
  end
end
