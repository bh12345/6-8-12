class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :content
      t.integer :author
      t.string :tags
      t.integer :rating, default: 0

      t.timestamps
      add_foreign_key :author
    end
  end
end
