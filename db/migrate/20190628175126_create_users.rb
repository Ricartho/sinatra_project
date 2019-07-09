class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |el|
      el.string :pseudo
      el.string :email
      el.string :password_digest
      #el.string :type
    end
  end
end
