class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :name_jp
      t.string :name_en
      t.integer :category
      t.string :image_url

      t.timestamps
    end
  end
end
