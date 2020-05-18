#!gash

set -e

test ! "${SRC_MODE}" -gt 3
test ! "${SRC_MODE}" -lt 1
test ! -z "${SRC_MODE}"

exit 0
