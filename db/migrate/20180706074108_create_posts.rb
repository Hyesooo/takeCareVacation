class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      
      t.integer :kinds
      t.string :title
      t.text :content

      t.timestamps null: false
    end
  end
end
