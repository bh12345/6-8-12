class DeleteTimestampsFromLrResult < ActiveRecord::Migration[5.1]
  def change
    remove_column :lr_results, :created_at
    remove_column :lr_results, :updated_at
  end
end
