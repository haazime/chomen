class AddRowOrderToChunks < ActiveRecord::Migration
  def change
    add_column :chunks, :row_order, :integer
  end
end
