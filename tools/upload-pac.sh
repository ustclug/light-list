#!/bin/bash

ftp -p -n $FTP_HOST << EOF
quote USER $FTP_USER
quote PASS $FTP_PASS
cd light
put http.pac
put https.pac
quit
EOF

