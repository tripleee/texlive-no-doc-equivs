texlive-no-doc
==========

This is a simple `equivs` package to convince `dpkg` that you have already
installed all those `texlive-*-doc` packages so that they won't be downloaded
e.g. when you are simply trying to build a piece of documentation in CI.

For background, see also e.g.
https://tex.stackexchange.com/questions/397174/minimal-texlive-installation/489125#489125

To use this package on Debian Stretch, run

    curl -s https://packagecloud.io/install/repositories/tripleee/texlive-no-doc/script.deb.sh |
    sudo bash

The set of packages are created with an epoch prefix `99:` in the version number
to make sure they are always regarded as newer than the official Debian packages.

Obviously, don't use this for anything except quick and dirty CI where you want to
make sure you keep the unnecessary documentation out of your system.
