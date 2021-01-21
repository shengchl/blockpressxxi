class TorrentSerializer < ActiveModel::Serializer
  attributes :id, :timed_out, :info_hash, :file_name, :file_content
end
