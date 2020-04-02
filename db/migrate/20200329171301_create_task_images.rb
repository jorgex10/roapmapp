class CreateTaskImages < ActiveRecord::Migration[6.0]
  def change
    create_table :task_images do |t|
      t.references :task, foreign_key: true
      t.text :image_data, null: false

      t.timestamps
    end
  end
end
