class CreateCocktails < ActiveRecord::Migration[5.2]
  def change
    create_table :cocktails do |t|
      t.string :name
      mount_uploader :photo, PhotoUploader

      t.timestamps
    end
  end
end
