# Phanbook

**Delightfully simple forums.** [Phanbook](http://phanbook.com) is the next-generation forum software that makes online discussion fun again. Also the name Phanbook is mean - Phan(Phalcon PHP)book(the your note book)

[Live Demo](http://phanbook.com) -
[Development Forum](http://meta.phanbook.com) -
[Twitter](http://twitter.com/) -
[Contact](mailto:hello@phanbook.com) -
[Donate](http://phanbook.com/donate)

[![Salck](https://img.shields.io/badge/slack-join%20chat%20%E2%86%92-brightgreen.svg?style=flat-square)](http://chat.phalcontip.com)

## Build Status:

[![wercker status](https://app.wercker.com/status/fc4506f68f8c38271cb4cc514e1e90ea/m/master "wercker status")](https://app.wercker.com/project/bykey/fc4506f68f8c38271cb4cc514e1e90ea)

[![Build Status](https://api.travis-ci.org/Phanbook/phanbook.svg?branch=master)](http://travis-ci.org/phanbook/phanbook)
## Goals

- **Fast and simple.** No clutter, no bloat, no complex dependencies. Phanbook is built with Phalcon PHP so it's quick and easy to deploy. 
- **Beautiful and responsive.** This is forum software for humans. Phanbook is carefully designed to be consistent and intuitive across platforms, out-of-the-box. It's backed by LESS, so themeing is a cinch.
- **Powerful and extensible.** Customize, extend, and integrate Phanbook to suit your community. Phanbook's architecture is amazingly flexible, prioritizing comprehensive APIs and great documentation.
- **Free and open.** Phanbook is released under the [GNU General license](https://github.com/phanbook/phanbook/blob/master/LICENSE.txt).

## Features

We want Phanbook to be the most powerful forum software out there, and we have a huge list of ideas that we want to implement. It will take time, but Phanbook’s flexible plugin system will mean we can release early and often. Here’s a snapshot of what we’ll be working on first:

- Mutiple Theme
- Spam Blocking
- Markdown and rich text editing support
- Powerful search
- Single sign-on (Facebook, Twitter, GitHub, etc.)
- Topic/category subscriptions and digest emails
- File attachments
- Post flagging/reporting and an intelligent auto-moderation system
- Rewards, badges, and gamification
- Q&A format and voting

## Installation

**Phanbook is currently in development and will be ready to use later this year.** ([Roadmap](http://phanbook.com/roadmap/)) If you want to give the development version a spin or are interested in contributing, for now you can install Phanbook's Vagrant image. An easier installation process will become a priority once Phanbook is more stable.

1. Install [Vagrant](https://www.vagrantup.com) and [VirtualBox](https://www.virtualbox.org).
2. Clone this repository and set up the Vagrant box:

  ```sh
  git clone --depth=1 https://github.com/phanbook/phanbook.git
  chmod +x phanbook && ./phanbook up
  ```

3. Add an entry to your /etc/hosts file:

  ```192.168.33.33 phanbook.dev```

4. Visit phanbook.dev or 192.168.33.33 in a browser. To get full information how to setup that can see [here](http://github.com/phanbook/docs/install.md)

## Docker
To play Phanbook with Docker you just do follow command below:

```
chmod +x phanbook
./phanbook docker #it will use default password is phanbook
./phanbook docker mysql_password # change mysql_password to you want use it
```
Visit 127.0.0.1 in a browser. If you use windown see more [here](http://github.com/phanbook/docs/install.md)

## Security
We take security very seriously at Phanbook; all our code is 100% open source and peer reviewed. Please read our security guide for an overview of security measures in Phanbook.

## Contributing

Phanbook is 100% free and open-source. We encourage and support an active, healthy community that accepts contributions from the public – including you!

Before contributing to Phanbook:

1. Please read the complete mission statements on phanbook.com. Yes we actually believe this stuff; you should too.
2. Read and sign the Electronic Phanbook Forums Contribution License Agreement.
3. Dig into [CONTRIBUTING.MD](https://github.com/phanbook/phanbook/blob/master/CONTRIBUTING.md)!, which covers submitting bugs, requesting new features, preparing your code for a pull request, etc.
4. Not sure what to work on? We've got some ideas.
5. Please note that bug reports should go in [phanbook/phanbook](https://github.com/phanbook/phanbook/issues) or the [relevant extension repository](https://github.com/phanbook).

We are look forward to seeing your pull requests!

## The Phanbook Team

The original Phanbook code contributors can be found in [AUTHORS.MD](https://github.com/phanbook/phanbook/blob/master/docs/AUTHORS.md). For a complete list of the many individuals that contributed to the design and implementation of Phanbook, please refer to the official Phanbook blog and GitHub's list of contributors.

## Copyright / License

Copyright 2014 - 2015 Phanbook Construction Kit, Inc.

Licensed under the GNU General Public License Version 2.0 (or later); you may not use this work except in compliance with the License. You may obtain a copy of the License in the LICENSE file, or at:

http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
