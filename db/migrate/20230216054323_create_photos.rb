class CreatePhotos < ActiveRecord::Migration[6.1]
  def change
    create_table :photos do |t|
      t.text :image
      t.text :text
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
