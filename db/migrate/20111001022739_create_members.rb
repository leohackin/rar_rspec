class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.string :email
      t.string :gender
      t.string :twitter
      t.integer :win

      t.timestamps
    end
  end
end
