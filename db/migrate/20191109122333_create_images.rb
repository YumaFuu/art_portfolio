class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :name_jp
      t.string :name_en
      t.integer :category
      t.binary :image_data, :limit => 5.megabyte

      t.timestamps
    end
  end
end
