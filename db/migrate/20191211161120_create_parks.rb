class CreateParks < ActiveRecord::Migration[6.0]
  def change
    create_table :parks do |t|
      t.string :name
      t.string :state
      t.string :url
      t.string :description
      t.string :image
      t.float :lat
      t.float :long

      t.timestamps
    end
  end
end
