class RemoveImpressionnistCountFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :impressionist_count, :integer
  end
end
