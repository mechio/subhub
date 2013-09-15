# Synposis

Add an 'Open in Sublime' button to GitHub

![Screenshot](https://raw.github.com/mechio/subhub/master/screenshot.png)

Clicking the button clones the repository into `~/.subhub` before opening it in Sublime Text 3

# Requirements

* OSX or Windows
* Sublime Text 3
* Chrome

# Settings
 * **if_exists** - what to do the repo already exists on the local computer possible options: 
	 * pull - update your local repository to the newest commit 
	 * nothing - it will just open the local copy

 
# Installation

1. Install the [Chrome Extension](https://chrome.google.com/webstore/detail/subhub/dndgngopahigljbjkfihmkaaaeceagbg)
2. Get the plugin from [Sublime Package Control](http://wbond.net/sublime_packages/package_control) via the `Sublime Text -> Preferences -> Package Control: Install Package` menu item.


## Installation without Package Control

``` bash
  cd ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/
  git clone https://github.com/mechio/subhub.git
```

# TODOs

* Linux support
* <del>Windows support</del>
* Sublime Text 2 support
* Support Firefox & Safari

### Author: [mech.io](http://mech.io)
### Contributors: [Barnaby Malet](http://twitter.com/barnabymalet), [Namit Chadha](http://twitter.com/namitchadha), [Mihai Vilcu](https://github.com/ionutvmi)
