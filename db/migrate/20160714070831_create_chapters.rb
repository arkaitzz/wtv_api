class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.references :serial, index: true
      t.integer :season
      t.integer :chapter

      t.timestamps
    end
  end
end
