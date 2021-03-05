#/bin/bash
pip freeze > python-packages.txt
dpkg --get-selections > apt-packages.lst
rclone copy --dry-run -vv / b2:cobular --filter-from ./rclone-backup-filter.txt --log-file=rclone-log-$(date +%Y%m%d%H%M%S).log
