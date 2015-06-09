class CreateBobans < ActiveRecord::Migration
  def change
    create_table :bobans do |t|
      t.string :title
      t.text :content

      t.timestamps null: false
    end
  end
end
