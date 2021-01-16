class AddInfohashesToAddressPosts < ActiveRecord::Migration
  def change
    add_column :address_posts, :info_hash, :string
    add_column :address_posts, :p2p_network_id, :integer
  end
end
