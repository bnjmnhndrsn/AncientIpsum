class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.references :quote, index: true
      t.references :taag, index: true

      t.timestamps
    end
  end
end
