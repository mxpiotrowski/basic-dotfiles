#! /bin/bash

for f in  .profile
do
    install -bCv "$f" ~
done

for f in .Xresources .bashrc .emacs .inputrc
do
    install -bCv -m 0644 "$f" ~
done

case $(uname) in
    Darwin)
	install -bCv -m 0644 \
		Library/Preferences/org.macosforge.xquartz.X11.plist \
		~/Library/Preferences/org.macosforge.xquartz.X11.plist
	;;
esac
