class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false
      t.integer :status, null: false, default: 0
      t.string :password_digest, null: false
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
