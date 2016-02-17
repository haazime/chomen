class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :content, null: false
      t.timestamps
    end
  end
end
