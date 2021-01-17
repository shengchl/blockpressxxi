require 'open3'

Open3.popen3("sleep 2; ls") do |stdout, stderr, status, thread|
  while line=stderr.gets do 
    puts(line) 
  end
end

100.times {`sh run_webtorrent.sh`}

