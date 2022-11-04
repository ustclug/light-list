#!/usr/bin/env expect

set timeout 300
spawn sftp -o StrictHostKeyChecking=no $env(FTP_USER)@$env(FTP_HOST)
expect "Password: "
send "$env(FTP_PASS)\r"
expect "sftp>"
send "cd light\r"
expect "sftp>"
send "put http-temp.pac\r"
expect "sftp>"
send "rename http-temp.pac http.pac\r"
expect "sftp>"
send "put https-temp.pac\r"
expect "sftp>"
send "rename https-temp.pac https.pac\r"
expect "sftp>"
send "bye\r"
expect "#"
