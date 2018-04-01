/usr/local/bin/brightness -l 2>/dev/null | awk '{split($0,a," "); print a[4]}' | grep -e '^\d.\d*$'
