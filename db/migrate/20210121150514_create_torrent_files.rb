class CreateTorrentFiles < ActiveRecord::Migration
  def change
    create_table :torrent_files do |t|
      t.string :torrent_info_hash
      t.string :name
      t.text :body

      t.timestamps null: true
    end

    add_index :torrent_files, :torrent_info_hash
    add_foreign_key :torrent_files, :torrents, column: :torrent_info_hash, primary_key: "info_hash"
    
  end
end
