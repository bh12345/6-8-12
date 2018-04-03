class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table  :comments do |t|
      t.integer   :post
      t.integer   :author
      t.string    :text
      t.integer   :rating, default: 0

      t.timestamps
      add_foreign_key :post
      add_foreign_key :author
    end
  end
end
