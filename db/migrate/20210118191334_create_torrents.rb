class CreateTorrents < ActiveRecord::Migration
  def change
    create_table :torrents do |t|
      t.boolean :timed_out
      t.string :info_hash
      t.string :file_name
      t.text :file_content

      t.timestamps null: false
    end
  end
end
