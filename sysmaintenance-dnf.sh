#!/bin/bash

echo -e "
\e[1;34m
░░      ░░  ░░░░  ░░      ░░  ░░░░  ░░      ░░        ░   ░░░  ░        ░        ░   ░░░  ░░      ░░   ░░░  ░░      ░░        ░
▒  ▒▒▒▒▒▒▒▒  ▒▒  ▒▒  ▒▒▒▒▒▒▒   ▒▒   ▒  ▒▒▒▒  ▒▒▒▒  ▒▒▒▒    ▒▒  ▒▒▒▒  ▒▒▒▒  ▒▒▒▒▒▒▒    ▒▒  ▒  ▒▒▒▒  ▒    ▒▒  ▒  ▒▒▒▒  ▒  ▒▒▒▒▒▒▒
▓▓      ▓▓▓▓    ▓▓▓▓      ▓▓        ▓  ▓▓▓▓  ▓▓▓▓  ▓▓▓▓  ▓  ▓  ▓▓▓▓  ▓▓▓▓      ▓▓▓  ▓  ▓  ▓  ▓▓▓▓  ▓  ▓  ▓  ▓  ▓▓▓▓▓▓▓      ▓▓▓
███████  ████  ██████████  █  █  █  █        ████  ████  ██    ████  ████  ███████  ██    █        █  ██    █  ████  █  ███████
██      █████  █████      ██  ████  █  ████  █        █  ███   ████  ████        █  ███   █  ████  █  ███   ██      ██        █
version 1                                                                                              copyleft gamecuber6 2025
\e[0m
"

echo -n "Enter your sudo password: "

read password

echo $password | sudo -S dnf5 upgrade -y

echo $password | sudo -S flatpak update -y

echo $password | sudo -S dnf5 autoremove -y

echo $password | sudo -S dnf5 clean all -y

echo $password | sudo -S rm -r /home/gamecuber/.cache/*

echo $password | sudo -S rm -r /var/log/journal/*

bleachbit --clean bash.history chromium.cache chromium.cookies chromium.dom chromium.form_history chromium.history chromium.passwords chromium.search_engines chromium.session chromium.site_preferences chromium.sync chromium.vacuum filezilla.mru firefox.backup firefox.cache firefox.crash_reports firefox.forms firefox.session_restore firefox.site_preferences firefox.url_history firefox.vacuum gwenview.recent_documents journald.clean kde.cache kde.recent_documents kde.tmp konqueror.cookies konqueror.current_session konqueror.url_history libreoffice.history system.cache system.clipboard system.desktop_entry system.recent_documents system.rotated_logs system.tmp system.trash thumbnails.cache vim.history vlc.memory_dump vlc.mru wine.tmp x11.debug_logs yum.clean_all yum.vacuum

echo $password | sudo -S bleachbit --clean bash.history chromium.cache chromium.cookies chromium.dom chromium.form_history chromium.history chromium.passwords chromium.search_engines chromium.session chromium.site_preferences chromium.sync chromium.vacuum filezilla.mru firefox.backup firefox.cache firefox.crash_reports firefox.forms firefox.session_restore firefox.site_preferences firefox.url_history firefox.vacuum gwenview.recent_documents journald.clean kde.cache kde.recent_documents kde.tmp konqueror.cookies konqueror.current_session konqueror.url_history libreoffice.history system.cache system.clipboard system.desktop_entry system.recent_documents system.rotated_logs system.tmp system.trash thumbnails.cache vim.history vlc.memory_dump vlc.mru wine.tmp x11.debug_logs yum.clean_all yum.vacuum

read -p "Updates have been done and the system has been fully cleaned up. Would you like to reboot? (y/n)" CONT
if [ "$CONT" = "y" ]; then
  echo $(reboot);
else
  echo $(kill -15 $PPID);
fi
