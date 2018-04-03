class CreateLrResults < ActiveRecord::Migration[5.1]
  def change
    create_table :lr_results do |t|
      t.string :str
      t.text :result

      t.timestamps
    end
  end
end
