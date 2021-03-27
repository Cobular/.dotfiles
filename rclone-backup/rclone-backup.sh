#/bin/bash
pip freeze > /home/cobular/rclone-backup/python-packages.txt
dpkg --get-selections > /home/cobular/rclone-backup/apt-packages.lst
sudo rclone copy -v / b2:cobular --filter-from /home/cobular/rclone-backup/rclone-backup-filter.txt --log-file=/home/cobular/rclone-backup/rclone-log-$(date +%Y%m%d%H%M%S).log --skip-links
