
Debian
====================
This directory contains files used to package nealcoind/nealcoin-qt
for Debian-based Linux systems. If you compile nealcoind/nealcoin-qt yourself, there are some useful files here.

## nealcoin: URI support ##


nealcoin-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install nealcoin-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your nealcoin-qt binary to `/usr/bin`
and the `../../share/pixmaps/nealcoin128.png` to `/usr/share/pixmaps`

nealcoin-qt.protocol (KDE)

