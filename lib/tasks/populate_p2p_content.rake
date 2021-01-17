require 'open3'

namespace :p2p do
  desc "Populate p2p content"
  task :populate, [:info_hash] => [:environment] do |t, args|

    t = <<-STR
          magnet:?xt=urn:btih:99354a95d802232a8c7de98aaed417549d5de675
          &dn=2021-01-Decentralized+Cash+Improvement+Proposals+Naming.md
          &tr=wss%3A%2F%2Ftracker.btorrent.xyz&tr=wss%3A%2F%2Ftracker.openwebtorrent.com
          &tr=udp%3A%2F%2Ftracker.leechers-paradise.org%3A6969&tr=udp%3A%2F%2Ftracker.coppersurfer.tk%3A6969
          &tr=udp%3A%2F%2Ftracker.opentrackr.org%3A1337&tr=udp%3A%2F%2Fexplodie.org%3A6969&tr=udp%3A%2F%2Ftracker.empire-js.us%3A1337
        STR
           

    stdout, stderr, status = Open3.capture3(
    a = AddressPost.find_by(info_hash: args[:info_hash])
    puts(a&.info_hash || "ADDRESS NOT FOUND")
  end
end
