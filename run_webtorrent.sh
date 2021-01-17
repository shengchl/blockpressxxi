#!/bin/bash
webtorrent download "magnet:?xt=urn:btih:99354a95d802232a8c7de98aaed417549d5de675&dn=2021-01-Decentralized+Cash+Improvement+Proposals+Naming.md&tr=wss%3A%2F%2Ftracker.btorrent.xyz&tr=wss%3A%2F%2Ftracker.openwebtorrent.com&tr=udp%3A%2F%2Ftracker.leechers-paradise.org%3A6969&tr=udp%3A%2F%2Ftracker.coppersurfer.tk%3A6969&tr=udp%3A%2F%2Ftracker.opentrackr.org%3A1337&tr=udp%3A%2F%2Fexplodie.org%3A6969&tr=udp%3A%2F%2Ftracker.empire-js.us%3A1337" -p8000 --keep-seeding -q &
echo $! > tmp/pids/webtorrent.pid
