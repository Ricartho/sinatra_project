class CreateTables < ActiveRecord::Migration
  def change

    create_table :categories do |el|
      el.string :category_name
      el.belongs_to :user,index: true
    end

    create_table :authors do |el|
      el.string :first_name
      el.string :last_name
      el.string :phone
      el.string :adresse
      el.belongs_to :user, index: true
    end

    create_table :articles do |el|
      el.string :article_name
      el.string :description
      el.belongs_to :user, index: true
      el.belongs_to :category, index: true
      el.belongs_to :author, index: true
    end

  end
end
