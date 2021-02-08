class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :authors
      t.string :description
      t.string :publisher
      t.string :image_url
      t.string :buy_url
      t.string :isbn10
      t.string :isbn13
      t.references :collection, null: false, foreign_key: true

      t.timestamps
    end
  end
end
