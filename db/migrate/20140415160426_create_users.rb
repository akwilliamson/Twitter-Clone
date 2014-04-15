class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.attachment :avatar

      t.timestamps
    end

    create_table :tweets do |t|
      t.string :message
      t.belongs_to :user
      t.attachment :photo

      t.timestamps
    end

    create_table :followers do |t|
      t.belongs_to :user
      t.integer :follower_id
    end
  end
end
