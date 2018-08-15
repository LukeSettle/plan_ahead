class CreateLodgingEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :lodging_events do |t|
      t.string :address
      t.string :title
      t.float :price
      t.string :price_type
      t.string :link
      t.string :confirmation_number
      t.string :currency
      t.string :starts_at
      t.string :ends_at
      t.references :plan, index: true

      t.timestamps
    end
  end
end
