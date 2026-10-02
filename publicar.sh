#!/bin/sh
set -e
APP="$HOME/Library/CloudStorage/Dropbox/Documentos Luis/Fitness/app-coach"
cd "$(dirname "$0")"
python3 "$APP/build.py" > /dev/null
{ cat head.html; cat "$APP/coach.html"; printf '\n</body></html>'; } > site/index.html
rsync -a --delete "$APP/v/" site/v/
git add -A
git commit -m "${1:-Publish Coach}"
git push
