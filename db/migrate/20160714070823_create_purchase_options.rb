class CreatePurchaseOptions < ActiveRecord::Migration
  def change
    create_table :purchase_options do |t|
      t.references :product, index: true
      t.float :price
      t.string :video_quality

      t.timestamps
    end
  end
end
