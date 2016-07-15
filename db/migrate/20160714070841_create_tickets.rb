class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.references :user, index: true
      t.references :purchase_option, index: true
      t.datetime :purchase_date
      t.datetime :expiration_date

      t.timestamps
    end
  end
end
