class Posts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :title_description
      t.text :content

      t.timestamps
    end
  end
end
