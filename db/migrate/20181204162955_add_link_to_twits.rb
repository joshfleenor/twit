class AddLinkToTwits < ActiveRecord::Migration[5.1]
  def change
    add_column :twits, :link, :string
  end
end
