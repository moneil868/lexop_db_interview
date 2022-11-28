class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string          :title,                                   null: false
      t.string          :slug,                                    null: false
      t.string          :excerpt,                                 null: false
      t.string          :author,                                  null: false
      t.date            :publication_date,                        null: false
      t.string          :category,                                null: false  
      t.timestamps
    end

    add_index :articles, [:title, :author, :category], unique: true
  end
end
