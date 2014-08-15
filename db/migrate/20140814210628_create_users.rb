class CreateUsers < ActiveRecord::Migration
  def change
      create_table :users do |t|
      t.string :email, null: false, unique: true
      t.string :password_digest, null: false, unique: true
      t.string :session_token, unique: true
      t.float :lat
      t.float :lng

      t.timestamps
    end

    add_index :users, :email
    add_index :users, :session_token
    add_index :users, :lat
    add_index :users, :lng
  end
end
