class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.date            :date
      t.integer         :count,             default: 0
      t.references      :article,           null: false, foreign_key: true

      t.timestamps
    end
  end
end
