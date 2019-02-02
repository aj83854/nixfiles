\*nix utilities
=============

A repository of (*potentially*) useful automation / utility scripts for various Linux distros.

_______________________________________________

# bootstrap_ubuntu.sh
**`bootstrap_ubuntu.sh` is a quick-setup script that installs vim8.x, pip3 and pipenv for python3, and some minor OS configs when executed. It is useful for quickly configuring a new Ubuntu Linux install with dependencies & development tools that are commonly required.**

This is intended/tested on Ubuntu 18.04 and above, but, being a simple bash script it *should* still work for prior versions.

*Feel free to modify the script to your liking to include or remove components/packages to fit your needs.*

### Instructions

*NOTE: If you intend to clone this script instead of copy/pasting into your own, make sure you install git as it is not pre-installed on new Ubuntu installations: `sudo apt install git`*

**1**. Start a new terminal session, and type the following to download this repo:

~~~
git clone https://github.com/aj83854/nixfiles.git
~~~

**2**. Rename & `cd` into a folder of your choice (in this example, `bin`):

~~~
mv ~/nixfiles ~/bin && cd bin
~~~

**3**. Provide permissions for the script to run:

~~~
chmod 755 bootstrap_ubuntu.sh
~~~

**4**. Execute the script:

~~~
./bootstrap_ubuntu.sh
~~~


_______________________________________________
