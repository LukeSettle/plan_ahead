class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title
      t.references :plan, index: true
      t.datetime :starts_at
      t.datetime :ends_at
      t.string :kind

      t.timestamps
    end
  end
end
