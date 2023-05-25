class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.boolean :is_public
      t.datetime :published_at
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
