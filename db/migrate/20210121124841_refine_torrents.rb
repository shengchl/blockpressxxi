class RefineTorrents < ActiveRecord::Migration
  def change

    # now I have more time after the hackathon: let's do this in a "right" way
    # remove surrogate id and change identificator to "native" info_hash
    remove_column :torrents, :id, :integer
    add_index :torrents, :info_hash, unique: true

    # remove booleans and create ENUM torrent_status
    remove_column :torrents, :timed_out, :string

    # store reason in case of failure
    add_column :torrents, :reason, :string

    # remove file attributes (for files we will create a separate table)
    remove_column :torrents, :file_name, :string
    remove_column :torrents, :file_content, :text

    # address_post table: add foreign key on info_hash 
    add_index :address_posts, :info_hash
    # add_foreign_key :address_posts, :torrents, column: :info_hash, primary_key: "info_hash"

    reversible do |change|
      change.up do
        execute <<-SQL
                  CREATE TYPE torrent_status AS ENUM ('success', 'in_progress', 'fail', 'time_out');
                SQL
        add_column :torrents, :status, :torrent_status
        add_index :torrents, :status
      end
      
      change.down do
        remove_column :torrents, :status
        execute <<-SQL
                  DROP TYPE torrents_status;
                SQL
      end
    end
    
  end

end
