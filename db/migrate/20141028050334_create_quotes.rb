class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.text :content
      t.integer :length

      t.timestamps
    end
  end
end
