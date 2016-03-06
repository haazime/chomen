class CreateChunks < ActiveRecord::Migration
  def change
    create_table :chunks do |t|
      t.references :page, null: false
      t.string :gcid, null: false
      t.integer :number, null: false
      t.text :content, null: false

      t.timestamps null: false
    end
  end
end
