=====
PyLNP
=====
------------------------------------------------
A Pack for Lazy and/or Newb-y dwarves everywhere
------------------------------------------------

PyLNP is a port of LucasUP and tolyK's Lazy Newb Pack to Python, making it possible to run the program on all platforms DF runs on.

Differences
===========
There are a few user-visible differences and enhancements compared to v16, such as:

- Any folder starting with "df" is considered a valid name for the Dwarf Fortress folder. This allows a freshly extracted copy to be recognized immediately.
- If multiple valid DF folders are detected, you will be asked to select the desired instance. This allows you to manage multiple installs separately. (Similar feature exists in v17.2 by daveralph1234)
- A new menu item, File > Output log has been added. This opens a window containing various messages captured while executing the launcher. If errors occur, they will show up here, and are also written to a file.
- In addition to excluding specific file names from utilities, you can also *include* specific file names, if they're found. Simply create a file include.txt in the Utilities folder and fill it in with the same syntax as exclude.txt.
- Multiple utilities can be selected and launched simultaneously.
- Utilities may be automatically started at the same time as Dwarf Fortress. (Also seen in v16.1 by daveralph1234, although with a different interface)
- Color scheme installation and preview
- Installing graphics sets by patching instead of replacing init.txt and d_init.txt. This preserves all options not strictly related to graphics sets.

Platform-specific notes
=======================
Each platform will detect different file types in the Utilities pane.

Windows:
  \*.exe, \*.jar, \*.bat
Linux:
  \*.jar, \*.sh
OS X:
  \*.app, \*.jar, \*.sh

You can use the include.txt mechanism to display executables not matched by these filters.

Pre-built executables
=====================
Stand-alone pre-built executables are available for Windows, Linux and OS X; see the forum topic. Simply download and extract the appropriate file.

If you think the download is too large, I suggest running from source instead. There really isn't much to it, especially if you can live with a slightly less pretty logo.

*Note for Windows users:*
  If the program refuses to start, or gives an error message like:

    The application has failed to start because the side-by-side configuration is incorrect. Please see the application event log for more details.

  you most likely need to install the Microsoft Visual C++ 2008 redistributable package: http://www.microsoft.com/en-us/download/details.aspx?id=29

Running from source
===================
You will need to match the directory structure of the normal LNP. A download without utilities is available in the topic.

You need Python installed to run the source code, preferably Python 2.7. Python 3.1 or later should also work, but may not be as well tested.

Python 2.6 or 3.0 do not include the necessary Ttk library. It *may* work if you install http://code.google.com/p/python-ttk/, but you're on your own for that. I recommend you upgrade, or use a pre-built executable.

If you already have Python, but don't know which version you're using, open a command-line/Terminal and type "python --version". If this gives you Python 3.0, try "python2 --version"; if that returns Python 2.7, you will probably want to edit the first line of the .py and .pyw files to read "python2" instead of "python".

Installing prerequisites
------------------------
This program has a few dependencies which you may need to take care of before running the source code:

- Since the program is written in Python, you will of course need to install Python. Linux and OS X 10.7 or later will most likely already have a suitable version; see above how to check this.
- The GUI requires the standard Python libraries Tkinter and Ttk, which is included in the Python installation on Windows and OS X. Linux users *may* need to install it through their package manager (look for python-tk or other similarly named package)
- *Optional:* For Python installations built against Tk 8.5: A PIL-compatible Python library (e.g. PIL itself or Pillow) will improve the visual quality of the logo by using a PNG version instead of a GIF. (On Linux, this also applies to the window icon.)

If this final dependency is not met, File > Output log will contain a line that starts with

  Note: PIL not found and Tk version too old for PNG support...

The program will still work, it will just look a little less pretty.

Windows:
  Download a Windows installer for Python from http://python.org, which will contain everything required to run the program. Pick Python 2.7 unless you really want Python 3 - the program should work with both, but I'm testing it under 2.7, so that might be the simplest version to use.

  To get a better looking logo, first install setuptools: https://pypi.python.org/pypi/setuptools/0.9.8#windows

  Next, open a command-line to the Scripts directory in your Python installation and run the command "easy_install pillow".

Linux:
  Virtually all Linux distributions these days include Python, although especially older installations may not have an appropriate version, and some may not have Tk support installed by default.

  If you can't get it to work, you'll need to install those things. This assumes a Debian-based distribution (including Ubuntu and Linux Mint). For other distributions, look for similar packages in your package manager.

  - **Required:** python-tk
  - Optional: python-imaging-tk (used to show nicer version of icon and logo)

  If you try to install python-imaging-tk, it should automatically bring in python-tk.

OS X:
  If you're running OS X 10.7 or later, you should have everything that's required. For 10.6 or earlier, upgrade Python to 2.7 or the latest 3.x release; an installer is available on http://python.org.

  To make the logo look better, you will need to install Pillow, a python library for images. If you have MacPorts installed, use it to install the package py-Pillow. If not, keep reading.

  First, you need to install command-line compilers. The easiest way I've found is to install Xcode, then open it and go to Preferences > Downloads and install them from there. It should also be possible to download these compilers directly from https://developer.apple.com/downloads/, but you're on your own for that.

  Once the compilers are in place, open a Terminal and type "sudo easy_install pillow". OS X should come with the libraries needed to build Pillow to load the logo.

Running the source code
-----------------------
Windows:
  Double-click launch.py in the LNP folder. If you want to get rid of the console window that pops up, rename it to launch.pyw.
Linux:
  Make sure launch.py is executable. Next, double-click and run it, or start a terminal and execute it from there with "python launch.py" or "./launch.py".
OS X:
  OS X does not provide a way to launch a Python script from Finder, so start a terminal, navigate to the directory, and execute "python launch.py" or "./launch.py".

Modifying the source code
=========================
PyLNP is licensed under the ISC license (see COPYING.txt), which essentially allows you to modify and distribute changes as you see fit. (This only applies to the launcher. Any bundled utilities, graphics packs, etc. have their own licenses; refer to those projects separately.)

Building your own executable
============================
If you want to make your own executable, you can do that. This is particularly useful on OS X, which doesn't have any good way of launching a Python script directly from Finder.

The executables are built using PyInstaller. If you want to use a different executable generator, you'll need to do the appropriate modifications yourself.

These instructions are tested with Python 2.7, but should work with 3.x as well. You may be able to substitute "easy_install" with "pip install".

Note:
  The resulting executable must be placed in the same directory as the LNP.py script is currently placed (it should be next to your Dwarf Fortress folder, and the LNP data folder). This is because it relies on a specific directory structure in order to find the Dwarf Fortress folder, as well as utilities, graphics packs, etc.

Windows
-------
Installing prerequisites:
  You'll need PyInstaller, preferably version 2.0 or later: http://www.pyinstaller.org/

  The best way I've found to install that is to first install setuptools: https://pypi.python.org/pypi/setuptools/0.9.8#windows

  Manually install pywin32: http://sourceforge.net/projects/pywin32/files/pywin32/

  Next, run "easy_install pyinstaller" from the Scripts directory in your Python installation.

Building:
  Open the LNP directory in a Command Prompt and type "pyinstaller lnp.spec". Wait for the build to finish, and you will find a new folder named dist. Inside that folder is the stand-alone executable, named lnp.exe.

Linux
-----
Installing prerequisites:
  You'll need PyInstaller, preferably version 2.0 or later: http://www.pyinstaller.org/

  The easiest way to install it is to use your package manager to install it directly (if available), or first install python-pip from your package manager and then run "sudo easy_install pyinstaller" in a terminal.

Building:
  Open the LNP directory in a Terminal and type "pyinstaller lnp.spec". Wait for the build to finish, and you will find a new folder named dist. Inside that folder is the stand-alone executable, named lnp.

OS X
----
Installing prerequisites:
  You'll need PyInstaller, preferably version 2.0 or later: http://www.pyinstaller.org/

  A simple way to install it is to open a terminal and type "sudo easy_install pyinstaller".

  You may also need to install command-line compilers; see above.

Building:
  Open the LNP directory in a Terminal and type "pyinstaller lnp.spec". Wait for the build to finish, and you will find a new folder named dist. Inside that folder is the application bundle, PyLNP.

When something goes wrong
=========================
You may experience error messages or similar issues while running the program. As long as it has not crashed, you can retrieve these error messages by opening File > Output log. The contents shown in here can be very useful for fixing the problem, so include them if you report an error.

If the program *does* crash, you can look at stdout.txt and stderr.txt which are automatically created in the application directory and show the same contents as the output log inside the program. Note that these files get overwritten every time the program launches.

Please be as specific as possible when reporting an error - tell exactly what you were doing. If you were installing a graphics pack, mention which one (provide a link to where you got it). If the problem is with a utility, make sure the utility works if you launch it manually - if it doesn't, then it's a problem with the utility, not with PyLNP.

TODO/Ideas
==========
* Better (more) error handling
* General code cleanup
* Explicit patches for installing graphics packs
* Other things?
