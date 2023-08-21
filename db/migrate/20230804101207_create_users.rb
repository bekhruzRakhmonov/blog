class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :image
      t.string :encrypted_password
      t.string :provider
      t.string :uid
      t.boolean :admin

      t.timestamps
    end
  end
end
