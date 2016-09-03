#!/bin/bash

lists=$1

cat << EOF
function FindProxyForURL(url, host) {

     var proxyList = {
EOF

cat $lists |
( 
( read l && echo $l | awk "{printf(\"'%s':1\",\$1)}" ) &&
    awk "{printf(\",\\n'%s':1\",\$1)}"
)

cat << EOF

     };

    var proxy = 'PROXY light.ustclug.org:29979; DIRECT';

    function testDomain(target, domains) {
        var idxA = target.lastIndexOf('.');
        var idxB = target.lastIndexOf('.', idxA - 1);
        var hasOwnProperty = Object.hasOwnProperty;
        while (true) {
            if (idxB === -1) {
                if (hasOwnProperty.call(domains, target)) {
                    return true;
                } else {
                    return false;
                }
            }
            suffix = target.substring(idxB + 1);
            if (hasOwnProperty.call(domains, suffix)) {
                return true;
            }
            idxB = target.lastIndexOf('.', idxB - 1);
        }
    }

    // fix error message in FoxyProxy when switching tabs. http://verihy.me/posts/foxyproxy-pac/
    if (typeof host === 'undefined'
     || isPlainHostName(host)
     || host === '127.0.0.1'
     || host === 'localhost') {
        return 'DIRECT';
    }

    if (testDomain(host, proxyList)) {
        return proxy;
    }

    return 'DIRECT';

}
EOF
