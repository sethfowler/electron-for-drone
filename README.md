# electron-for-drone
A Docker image with preinstalled dependencies for testing Electron apps on Drone CI.

This is based on the standard `node` Docker image, so it includes everything you
need to test Electron apps using Spectron on Drone.

Xvfb is also included; running your Spectron tests using
[xvfb-maybe](https://www.npmjs.com/package/xvfb-maybe) is highly recommended so
that they'll work both locally and on Drone.
