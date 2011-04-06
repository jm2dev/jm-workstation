Overview
========

My configuration files to trac FreeBSD stable. 

This is not a replacement for the fantastic documentation they provide:

[FreeBSD Handbook](http://www.freebsd.org/doc/en_US.ISO8859-1/books/handbook/updating-upgrading.html)

Instructions
============

rc.conf disabled services (no tomcat, database, X system) just the minimum to be online.

* Reboot, login as root and run

        $ csup -g -L 2 csup-UK-stable-supfile

* Rebuild world

        $ cd /usr/src
        $ make -j8 buildworld
        $ make -j8 buildkernel
        $ make -j8 installkernel
        $ shutdown -r now

* Reboot in single user mode

        $ adjkerntz -i

        $ mount -a -t ufs

        $ mergemaster -p

        $ cd /usr/src

        $ make -j8 installworld

        $ mergemaster

        $ reboot

* Update ports

       $ csup -g -L 2 portupgrade-UK-stable-supfile

       $ portupgrade -aP