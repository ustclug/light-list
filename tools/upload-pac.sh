#!/bin/bash

ftp -p -n $FTP_HOST << EOF
quote USER $FTP_USER
quote PASS $FTP_PASS
cd light
put http-temp.pac
rename http-temp.pac http.pac
put https-temp.pac
rename https-temp.pac https.pac
quit
EOF

