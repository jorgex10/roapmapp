class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.text :description
      t.integer :status, null: false, default: 0
      t.references :category, foreign_key: true
      t.references :group, foreign_key: true
      t.bigint :owner_id, foreign_key: { users: :id }

      t.timestamps
    end
  end
end
