class CreateTagsAndTaggings < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.timestamps
    end
    add_index :tags, :name, unique: true

    create_table :taggings do |t|
      t.references :taggable, polymorphic: true, index: true
      t.references :tag, index: true
      t.timestamps
    end
    add_index :taggings, [:taggable_id, :taggable_type, :tag_id], unique: true
  end
end
