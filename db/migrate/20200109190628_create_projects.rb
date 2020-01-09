class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.text :description
      t.datetime :init_date, null: false
      t.datetime :end_date, null: false
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
