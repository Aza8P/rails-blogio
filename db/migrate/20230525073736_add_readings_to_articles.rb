class AddReadingsToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :readings, :integer
  end
end
