class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :post_id
      t.text :body
      t.string :sent_by

      t.timestamps
    end
  end
end
