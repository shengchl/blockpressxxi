class RemoveLegacyAddressIdentsPostsFieldsLimits < ActiveRecord::Migration
  def up
	change_column :address_idents, :bio, :text, :limit => nil
	change_column :address_posts, :post_body, :text, :limit => nil
  end
end
