class CreateFlipbooks < ActiveRecord::Migration[7.0]
  def change
    create_table :flipbooks do |t|
      t.string :title
      t.string :subtitle
      t.string :description
      t.string :thumbnail
      t.string :url

      t.timestamps
    end
  end
end
