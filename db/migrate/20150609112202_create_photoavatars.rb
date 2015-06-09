class CreatePhotoavatars < ActiveRecord::Migration
  def change
    create_table :photoavatars do |t|
      t.string :title
      t.text :content

      t.timestamps null: false
    end
  end
end
