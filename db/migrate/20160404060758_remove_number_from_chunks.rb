class RemoveNumberFromChunks < ActiveRecord::Migration
  def change
    remove_column(:chunks, :number)
  end
end
