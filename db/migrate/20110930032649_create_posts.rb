class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :titulo
      t.string :status
      t.text :texto

      t.timestamps
    end
  end
end
