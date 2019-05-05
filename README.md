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

The packages are created with an epoch prefix `99:` in the version number
to make sure they are always regarded as newer than the official Debian packages.

Obviously, don't use this for anything except quick and dirty CI where you want to
make sure you keep the unnecessary documentation out of your system.

Building
------

There is a simple `Makefile` which clones the master `control` file and
builds a new `equivs` package for each clone,
and a `Dockerfile` to run this in a suitable fresh Debian image
and store the results back in the current directory after the build.

If you want builds for other platforms than Debian Stretch and Buster,
please create a request in the issue tracker here on GitHub.
