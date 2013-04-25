class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :subject
      t.text :body
      t.string :sent_by

      t.timestamps
    end
  end
end
