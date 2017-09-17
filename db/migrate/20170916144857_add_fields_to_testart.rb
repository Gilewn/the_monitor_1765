class AddFieldsToTestart < ActiveRecord::Migration[5.1]
  def change
    add_column :testarts, :author, :string
    add_column :testarts, :description, :string
    add_column :testarts, :publishedAt, :string
    add_column :testarts, :title, :string
    add_column :testarts, :url, :string
    add_column :testarts, :urlToImage, :string
  end
end
