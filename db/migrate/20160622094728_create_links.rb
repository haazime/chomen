class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.references :chunk, null: false
      t.string :title, null: false
    end
  end
end
