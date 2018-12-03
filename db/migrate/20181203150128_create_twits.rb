class CreateTwits < ActiveRecord::Migration[5.1]
  def change
    create_table :twits do |t|
      t.string :message
      t.integer :user_id

      t.timestamps
    end
  end
end
