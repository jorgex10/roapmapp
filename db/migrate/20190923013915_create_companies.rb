class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.string :url, null: false
      t.string :address, null: false, default: ''
      t.string :phone, null: false, default: ''

      t.timestamps
    end
  end
end
