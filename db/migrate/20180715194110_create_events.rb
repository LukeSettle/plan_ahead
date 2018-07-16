class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title
      t.references :plan, index: true
      t.datetime :start
      t.datetime :end
      t.string :type

      t.timestamps
    end
  end
end
