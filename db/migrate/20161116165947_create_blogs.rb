class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.integer :account_id
      t.text :content
      t.string :title

      t.timestamps null: false
    end
  end
end
