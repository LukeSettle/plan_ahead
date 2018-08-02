class CreateParentEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :parent_events do |t|
      t.string :title
      t.references :plan, index: true
      t.datetime :starts_at
      t.datetime :ends_at
      t.string :kind
      t.float :price
      t.string :currency
      t.string :link

      t.timestamps
    end
  end
end
