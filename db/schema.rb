# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20210121150514) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_managers", force: :cascade do |t|
    t.integer  "account_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "accounts", force: :cascade do |t|
    t.string   "account_guid", null: false
    t.string   "site_name",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "accounts", ["site_name"], name: "index_accounts_on_site_name", using: :btree

  create_table "address_followings", force: :cascade do |t|
    t.string   "action_tx",            limit: 80, null: false
    t.integer  "action_tx_block_id"
    t.integer  "action_tx_is_mempool"
    t.string   "follower_address_id",  limit: 80, null: false
    t.string   "following_address_id", limit: 80, null: false
    t.integer  "deleted",                         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "address_followings", ["action_tx"], name: "index_address_followings_on_action_tx", unique: true, using: :btree
  add_index "address_followings", ["deleted"], name: "index_address_followings_on_deleted", using: :btree
  add_index "address_followings", ["follower_address_id", "following_address_id"], name: "follower_address_idx", using: :btree
  add_index "address_followings", ["follower_address_id"], name: "index_address_followings_on_follower_address_id", using: :btree
  add_index "address_followings", ["following_address_id"], name: "index_address_followings_on_following_address_id", using: :btree

  create_table "address_hashtags", force: :cascade do |t|
    t.string   "hashtag",    limit: 80, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "address_hashtags", ["hashtag"], name: "index_address_hashtags_on_hashtag", unique: true, using: :btree

  create_table "address_idents", force: :cascade do |t|
    t.string   "address_id",                    limit: 50, null: false
    t.string   "name",                          limit: 76
    t.string   "set_profile_name_tx"
    t.integer  "set_profile_name_block_id"
    t.integer  "set_profile_name_is_mempool"
    t.text     "bio"
    t.string   "set_profile_bio_tx"
    t.integer  "set_profile_bio_block_id"
    t.integer  "set_profile_bio_is_mempool"
    t.string   "avatar"
    t.string   "set_profile_avatar_tx"
    t.integer  "set_profile_avatar_block_id"
    t.integer  "set_profile_avatar_is_mempool"
    t.string   "header"
    t.string   "set_profile_header_tx"
    t.integer  "set_profile_header_block_id"
    t.integer  "set_profile_header_is_mempool"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "address_idents", ["address_id"], name: "ident_addy_idx", unique: true, using: :btree
  add_index "address_idents", ["name"], name: "ident_name_idx", using: :btree

  create_table "address_images", force: :cascade do |t|
    t.string   "action_tx",            limit: 70
    t.integer  "action_tx_block_id"
    t.integer  "action_tx_is_mempool"
    t.string   "address_id",           limit: 50,  null: false
    t.string   "caption",              limit: 217
    t.string   "image_link_or_ipfs",   limit: 217
    t.integer  "image_created_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "address_images", ["action_tx"], name: "addy_images_atx_idx", unique: true, using: :btree
  add_index "address_images", ["action_tx_block_id"], name: "addy_images_blockid_idx", using: :btree
  add_index "address_images", ["address_id"], name: "addy_images_addyid_idx", using: :btree

  create_table "address_likes", force: :cascade do |t|
    t.string   "action_tx",               limit: 80, null: false
    t.integer  "action_tx_block_id"
    t.integer  "action_tx_is_mempool"
    t.string   "liker_address_id",        limit: 80, null: false
    t.string   "tip_receiver_address_id", limit: 80
    t.string   "like_tx",                 limit: 80, null: false
    t.integer  "tip_amount",              limit: 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "address_likes", ["action_tx"], name: "index_address_likes_on_action_tx", unique: true, using: :btree
  add_index "address_likes", ["like_tx"], name: "index_address_likes_on_like_tx", using: :btree
  add_index "address_likes", ["liker_address_id"], name: "index_address_likes_on_liker_address_id", using: :btree
  add_index "address_likes", ["tip_receiver_address_id"], name: "index_address_likes_on_tip_receiver_address_id", using: :btree

  create_table "address_post_hashtag_mappings", force: :cascade do |t|
    t.string   "hashtag",    limit: 80, null: false
    t.string   "post_tx_id", limit: 80, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "address_post_hashtag_mappings", ["hashtag", "post_tx_id"], name: "post_tx_hash_idx", unique: true, using: :btree
  add_index "address_post_hashtag_mappings", ["hashtag"], name: "index_address_post_hashtag_mappings_on_hashtag", using: :btree
  add_index "address_post_hashtag_mappings", ["post_tx_id"], name: "index_address_post_hashtag_mappings_on_post_tx_id", using: :btree

  create_table "address_post_pay_outputs", force: :cascade do |t|
    t.string   "action_tx",         limit: 70, null: false
    t.string   "output_address_id", limit: 50, null: false
    t.integer  "output_value",                 null: false
    t.integer  "output_number",                null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "address_post_pay_outputs", ["action_tx"], name: "addy_posts_po_atx_idx", using: :btree
  add_index "address_post_pay_outputs", ["output_address_id"], name: "addy_posts_po_oai_idx", using: :btree
  add_index "address_post_pay_outputs", ["output_value"], name: "addy_posts_po_ov_idx", using: :btree

  create_table "address_post_reposts", force: :cascade do |t|
    t.string   "originating_tx",      limit: 80, null: false
    t.string   "repost_tx_id",        limit: 80, null: false
    t.string   "reposted_post_tx_id", limit: 80, null: false
    t.string   "address_id",          limit: 80, null: false
    t.integer  "repost_created_at"
    t.integer  "block_id_synced"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "address_post_reposts", ["address_id"], name: "index_address_post_reposts_on_address_id", using: :btree
  add_index "address_post_reposts", ["repost_tx_id"], name: "index_address_post_reposts_on_repost_tx_id", unique: true, using: :btree
  add_index "address_post_reposts", ["reposted_post_tx_id"], name: "index_address_post_reposts_on_reposted_post_tx_id", using: :btree

  create_table "address_posts", force: :cascade do |t|
    t.string   "action_tx",            limit: 70
    t.integer  "action_tx_block_id"
    t.integer  "action_tx_is_mempool"
    t.string   "address_id",           limit: 50,             null: false
    t.text     "post_body"
    t.string   "post_image_ipfs"
    t.string   "reply_to_tx_id",       limit: 70
    t.integer  "is_like",                         default: 0, null: false
    t.integer  "post_created_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "community",            limit: 80
    t.integer  "media_type"
    t.string   "media_payload"
    t.integer  "sequence"
    t.integer  "tip_amount"
    t.string   "tip_address_id"
    t.string   "info_hash"
    t.string   "p2p_network_id"
  end

  add_index "address_posts", ["action_tx"], name: "addy_posts_atx_idx", unique: true, using: :btree
  add_index "address_posts", ["action_tx_block_id"], name: "addy_posts_blockid_idx", using: :btree
  add_index "address_posts", ["address_id"], name: "addy_posts_addyid_idx", using: :btree
  add_index "address_posts", ["community"], name: "index_address_posts_on_community", using: :btree
  add_index "address_posts", ["info_hash"], name: "index_address_posts_on_info_hash", using: :btree
  add_index "address_posts", ["is_like"], name: "addy_posts_is_like_atx_idx", using: :btree
  add_index "address_posts", ["media_type"], name: "index_address_posts_on_media_type", using: :btree
  add_index "address_posts", ["reply_to_tx_id"], name: "addy_repl_posts_atx_idx", using: :btree
  add_index "address_posts", ["sequence"], name: "index_address_posts_on_sequence", using: :btree

  create_table "broadcast_transactions", force: :cascade do |t|
    t.string   "txhash",             limit: 80, null: false
    t.text     "raw_tx",                        null: false
    t.text     "obj_tx",                        null: false
    t.integer  "is_success"
    t.integer  "attempt_count"
    t.string   "last_attempt_error"
    t.integer  "last_attempted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "broadcast_transactions", ["attempt_count"], name: "index_broadcast_transactions_on_attempt_count", using: :btree
  add_index "broadcast_transactions", ["is_success"], name: "index_broadcast_transactions_on_is_success", using: :btree
  add_index "broadcast_transactions", ["last_attempted_at"], name: "index_broadcast_transactions_on_last_attempted_at", using: :btree
  add_index "broadcast_transactions", ["txhash"], name: "index_broadcast_transactions_on_txhash", unique: true, using: :btree

  create_table "identities", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.string   "token"
    t.string   "secret"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "user_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "local_spent_utxos", force: :cascade do |t|
    t.string   "address",       limit: 80, null: false
    t.string   "txhash",        limit: 80, null: false
    t.integer  "output_number",            null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "local_spent_utxos", ["address"], name: "index_local_spent_utxos_on_address", using: :btree
  add_index "local_spent_utxos", ["output_number"], name: "index_local_spent_utxos_on_output_number", using: :btree
  add_index "local_spent_utxos", ["txhash"], name: "index_local_spent_utxos_on_txhash", using: :btree

  create_table "mempool_utxo_by_address", force: :cascade do |t|
    t.string   "address",       limit: 80, null: false
    t.string   "txhash",        limit: 80, null: false
    t.string   "script_hex",               null: false
    t.integer  "output_number",            null: false
    t.text     "obj_tx"
    t.integer  "value",         limit: 8,  null: false
    t.integer  "descendants"
    t.integer  "fee_value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mempool_utxo_by_address", ["address", "txhash", "output_number"], name: "mempool_tx_compound", unique: true, using: :btree
  add_index "mempool_utxo_by_address", ["address"], name: "mempool_tx_address", using: :btree
  add_index "mempool_utxo_by_address", ["txhash"], name: "mempool_tx_txhash", using: :btree

  create_table "network_connections", force: :cascade do |t|
    t.string   "network",            null: false
    t.string   "uid",                null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "handle",             null: false
    t.string   "token"
    t.string   "secret"
    t.string   "twitter_type"
    t.string   "twitter_dest"
    t.string   "facebook_type"
    t.string   "facebook_dest"
    t.integer  "connection_ok",      null: false
    t.string   "last_error"
    t.integer  "account_id",         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sync_stats", force: :cascade do |t|
    t.string   "next_block_to_sync",     null: false
    t.string   "last_block_sync_status", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "torrent_files", force: :cascade do |t|
    t.string   "torrent_info_hash"
    t.string   "name"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "torrent_files", ["torrent_info_hash"], name: "index_torrent_files_on_torrent_info_hash", using: :btree

# Could not dump table "torrents" because of following StandardError
#   Unknown type 'torrent_status' for column 'status'

  create_table "unspent_utxos", force: :cascade do |t|
    t.string   "address",    limit: 80, null: false
    t.text     "raw_data",              null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "unspent_utxos", ["address"], name: "index_unspent_utxos_on_address", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "encrypted_password",                 default: "", null: false
    t.string   "reset_password_token",   limit: 160
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token",     limit: 160
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "username",               limit: 80,               null: false
    t.text     "wallet_phrase"
    t.integer  "last_child_node_i"
    t.text     "masterxpub"
    t.string   "wif"
    t.string   "address_legacy",         limit: 80
    t.string   "address_legacy_hex",     limit: 80
    t.string   "address_cash",           limit: 80
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "badge_count"
  end

  add_index "users", ["address_cash"], name: "index_users_on_address_cash", using: :btree
  add_index "users", ["address_legacy"], name: "index_users_on_address_legacy", using: :btree
  add_index "users", ["address_legacy_hex"], name: "index_users_on_address_legacy_hex", using: :btree
  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  create_table "vins", force: :cascade do |t|
    t.string   "parent_tx",  null: false
    t.string   "vin_tx",     null: false
    t.text     "vin_blob",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "account_managers", "accounts", on_delete: :cascade
  add_foreign_key "account_managers", "users", on_delete: :cascade
  add_foreign_key "identities", "users", on_delete: :cascade
  add_foreign_key "network_connections", "accounts", on_delete: :cascade
  add_foreign_key "torrent_files", "torrents", column: "torrent_info_hash", primary_key: "info_hash"
end
