class ChangeDataTypeForPublishedAt < ActiveRecord::Migration[7.0]
  def change
    change_column :articles, :published_at, :date
  end
end
