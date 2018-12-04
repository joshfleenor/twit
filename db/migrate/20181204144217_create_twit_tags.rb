class CreateTwitTags < ActiveRecord::Migration[5.1]
  def change
    create_table :twit_tags do |t|
      t.integer :twit_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
