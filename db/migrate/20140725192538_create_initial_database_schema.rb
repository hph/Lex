class CreateInitialDatabaseSchema < ActiveRecord::Migration
  def change
    create_table :versions do |t|
      t.string :name, null: false
    end

    create_table :chapters do |t|
      t.integer :version_id, null: false
      t.string :name, null: false
      t.integer :ordinal, null: false
    end

    create_table :laws do |t|
      t.integer :version_id, null: false
      t.integer :chapter_id, null: false
      t.string :subchapter
      t.text :name, null: false
      t.integer :ordinal
      t.datetime :date, null: false
      t.text :raw_html, null: false
      t.string :original_uri, null: false
    end
  end
end
