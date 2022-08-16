class CreateComics < ActiveRecord::Migration[6.0]
  def change
    create_table :comics do |t|
      t.string :title, null: false
      t.string :author, null: false
      t.integer :volume, null: false
      t.integer :target_age_id, null: false
      t.integer :genre_id, null: false
      t.text :memo
      t.boolean :completion, null: false, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
