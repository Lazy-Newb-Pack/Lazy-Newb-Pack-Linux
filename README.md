# Lazy-Newb-Pack-Linux v0.43.05 x64
A small package to get people started with Dwarf Fortress on linux. Please take time to check out the [Official thread](http://www.bay12forums.com/smf/index.php?topic=163211.0). There are a few help documents in the [Wiki](https://github.com/Lazy-Newb-Pack/Lazy-Newb-Pack-Linux/wiki) if you should get stuck.

## Download Location
The Linux LNP Can be downloaded at the below location:

**[Dwarf Fortress File Depot](http://dffd.bay12games.com/file.php?id=12762)**

## Usage Instructions
Navigate to the extracted directory and run
```
$ ./startlnp
```

##### Terminal Configuration
When first launching a new version of the LNP, you'l be asked to select the terminal emulator used to launch Dwarf Fortress.  PyLNP will automatically detect several of the more popular terminal emulators, or you can specify a custom command.  Incorrectly configuring the terminal will result in Dwarf Fortress not launching properly.

If you run into troubles with this, consult the PyLNP documentation **[HERE](https://bitbucket.org/Pidgeot/python-lnp/overview#rst-header-platform-specific-notes)**

##### LNP Import Tips
When first launching a new version of the LNP, you'll be asked if you want to import files from a previous installation. If you select yes, open the previous version's df_linux folder in the file chooser dialog, then click ok. Selecting the LNP folder or the root of the pack will cause the import to fail. The import process will grab your DF saves, SoundSense and/or SoundCense sounds, gamelog, and dfhack history from the previous version.

## Included Mods
* [Pidgeot's PyLNP 0.12b Lazy Newb Pack Python interface](http://www.bay12forums.com/smf/index.php?topic=140808.0)
 * Utilities:
     * [DFHack Linux V0.43.05-r1 (gcc 4.8.1)](http://www.bay12forums.com/smf/index.php?topic=139553.0)
     * [TWBT 5.84](http://www.bay12forums.com/smf/index.php?topic=138754.0)
     * [Dwarf Therapist v37 (DanFritz's fork)](https://github.com/DanFritz/Dwarf-Therapist) (**compiled with qt4.8.7**)
     * [Soundsense r2016-1](http://df.zweistein.cz/soundsense/)
     * [SoundCenSe GTK 1.4.2](http://www.bay12forums.com/smf/index.php?topic=159567.0) (**Requires Mono, go [HERE](http://www.mono-project.com/download/#download-lin) for install instructions**)
     * [qfconvert 2.04](http://www.joelpt.net/quickfort/)
     * [DF Announcement Filter 1.01](http://www.bay12forums.com/smf/index.php?topic=130030.0)
     * [Legends Browser 1.12.2](http://www.bay12forums.com/smf/index.php?topic=155307.0) (**Requires Java 8**)
     * [Armok Vision 0.16.2](http://www.bay12forums.com/smf/index.php?topic=146473.0)
 * Graphics (Now using [fricy's Updated tilesets](http://www.bay12forums.com/smf/index.php?topic=155882)!)
     * [16x16] ASCII
     * [16x16] [Afro](https://github.com/DFgraphics/Afro-Graphics)
     * [20x20] [AutoReiv](https://github.com/DFgraphics/AutoReiv)
     * [18x18] [CLA](https://github.com/DFgraphics/CLA)
     * [24x24] [GemSet](https://github.com/DFgraphics/GemSet)
     * [16x16] [Ironhand](https://github.com/DFgraphics/Ironhand)
     * [12x12] [Jolly Bastion](https://github.com/DFgraphics/Jolly-Bastion)
     * [16x16] [Mayday](https://github.com/DFgraphics/Mayday)
     * [16x16] [Obsidian](https://github.com/DFgraphics/Obsidian)
     * [16x16] [Phoebus](https://github.com/DFgraphics/Phoebus)
     * [16x16] [Rally Ho](https://github.com/DFgraphics/Rally-Ho)
     * [16x16] [Spacefox](https://github.com/DFgraphics/Spacefox)
     * [20x20] [Taffer](https://github.com/DFgraphics/Taffer)
     * [16x16] [Tergel](https://github.com/DFgraphics/Tergel)
     * [16x16] [Wanderlust](https://github.com/DFgraphics/Wanderlust)


##   Dependencies
Install required packages

For Debian / Ubuntu
```
sudo apt-get install default-jre libsdl1.2debian:i386 libsdl-image1.2:i386 libsdl-ttf2.0-0:i386 libglu1-mesa:i386 libgtk2.0-0:i386 libopenal1:i386 libjpeg62-turbo:i386 wget coreutils tar xterm sed python bzip2 qtchooser libqt4-script libqt4-scripttools libqt5script5 libqt5scripttools5 libqxt-core0 libqxt-gui0
```

For Fedora (21)
```
yum install SDL.i686 SDL_image.i686 SDL_ttf.i686 mesa-libGLU.i686 gtk2.i686 zlib.i686 openal-soft.i686 xterm python qt qt-x11 bzip2 xorg-x11-fonts-Type1
```

## Tested On
* Debian Stretch - With deps listed above installed.

## Common Issues
See [the WIKI](https://github.com/Lazy-Newb-Pack/Lazy-Newb-Pack-Linux/wiki/Common-Errors).

******************************************************
## Linux LNP Changelog
### Release notes for 0.43.05-r2 (June 8, 2017):
##### Major changes over previous revision:
* Compiled Dwarf Therapist with Qt4 for better compatability
* Updated Legends Browser to 1.12.2.
* Updated PyLNP to 0.12b

##### Minor changes over previous revision:
* Began building README.md (this file) to assist in using the pack and improve record keeping of the maintainer(s)

##### Utilities included:
* PyLNP 0.12b
* DF 0.43.05
* DFHack 0.43.05-r1
* Dwarf Therapist 37.0.0 (DanFritz's fork built with Qt 4.8.7)
* TWBT 5.84
* Soundsense r2016-1
* SoundCenSe GTK 1.4.2
* Armok Vision 0.16.2
* Legends Browser 1.12.2


### Release notes for 0.43.05-r1 (June 8, 2017):
##### Major changes over previous revision:
* Updated DFHack to 0.43.05-r1.
* Updated TWBT to 5.84.
* Updated Legends Browser to 1.12.1.

##### Minor changes over previous revision:
* Added extra color schemes from wiki
* Removed Western Rust color scheme (incomplete scheme, caused issues with PyLNP)
* Added ```export LD_LIBRARY_PATH=""``` to the beginning of distro_fixes script for improved compatibility
* Tweaked DT launcher script to work better with LNP directory structure
* Included outdated (but still very useful) DT Manual
* Fixed gui/manager-quantity keybind
* Replaced obsolete references of autolabor with labormanager
* Other general cleanup/housekeeping

##### Utilities included:
* PyLNP 0.12a
* DF 0.43.05
* DFHack 0.43.05-r1
* Dwarf Therapist 37.0.0 (Hello71's fork built with Qt 5.7.1)
* TWBT 5.84
* Soundsense r2016-1
* SoundCenSe GTK 1.4.2
* Armok Vision 0.16.2
* Legends Browser 1.12.1

***
## Dwarf Fortress Changelog
### Release notes for 0.43.05 (July 5, 2016):
Here are the first official 64-bit releases!  This would not be possible without help from our community -- you can view the exciting and sometimes late-night discussion over in the 0.43.04 release thread if you want to see how the cake was baked.  This release should also make worlds generated with the same seed more consistent, and it has a few other minor fixes we managed to sneak in.

##### New stuff
* 64-bit support, pulling the game from the distant past into the previous decade

##### Major bug fixes
* Fixed problem with artistic skill assignment causing world histories to diverge
* Fixed problem with worldgen trade causing world histories to diverge

##### Other bug fixes/tweaks
* Stopped babies/children from competing in w.g. events
* Made gorlaks able to open doors, stopped desizing of their heads
* Fixed some mem leaks

***

### Release notes for 0.43.04 (June 20, 2016):
Here's another bug-fix release.  Assuming no issues crop up immediately, we'll now dive into 64-bit land for next time!

##### Major bug fixes
* Fixed error deciding when patients should be moved
* Fixed initialization problem with tools causing stone axes to be thought of as ranged
* Stopped completed work order jobs from checking off every matching order
* Stopped masterpiece trades in containers from triggering artwork defacement
* Stopped storage from always failing in the second tavern/library/temple you define
* Stopped broken crash-prone entry from appearing at the end of the stocks list

##### Other bug fixes/tweaks
* Attackers will remove armor from unconscious opponents if it is blocking attacks
* Made people wear more armor according to their roles again
* Allowed new citizens with some previously site-wide occupations to be reassigned
* Allowed some site-wide occupations for dwarves
* Made combat damage weapon and armors depending on material differences etc.
* Made dwarves prefer undamaged equipment during the periodic uniform upgrades
* Allowed strong attacks/shakes to translate some force to joints and parent parts even if blocked by armor
* Reduced clothing stopping power based on penetration depth
* Made paper slurries stockpile-able (won't work without updated raws)
* Fixed problem with adv mode tribute demand check
* Fixed ghost initial positioning problem
* Made macros save correctly even if the macro directory is deleted

***

### Release notes for 0.43.03 (May 22, 2016):
Here are some more bug fixes.

##### Major bug fixes
* Made customized magma forge jobs use metal instead of making things out of coal
* Adjusted conflict code to stop taverngoers from joining siegers over petty grievances
* Fixed material overcount in adv site work menu

##### Other bug fixes/tweaks
* Made pain from broken tissues depend on relative part size
* Made embark profiles load fish properly
* Made assigning an animal to a restraint remove it from pasture assignments properly
* Made pasturing jobs respect connectivity in creation and in seeing if they should continue
* Made dwarves remove animals assigned to pastures from cages/chains that are in the pasture
* Fixed display error causing creature to be described as gigantic too often
* Allowed metal mechanisms to be made from the job manager
* Made dragonfire affect metal items and generally amplified fire effects a bit
* Stopped veins in large mineral clusters from being improperly restricted
* Stopped placement issue with minerals that had more than one specific environment
* Stopped woodcutters from using axes without edges (like training axes)
* Allowed soil critters to live in wider temperature ranges
* Fixed problem with temperature checks on certain wilderness populations
* Made construct mechanisms job show material
* Made mountain travel restriction not affect other actions
* Allowed adventure mode divers to move through deep water properly
* Made placing items on tables remove item from your inventory properly
* Made improvement reactions increase and apply skill properly
* Reported site of adventurer masterpieces correctly
* Stopped manually-set low frame rate cap from being stuck

***

### Release notes for 0.43.02 (May 11, 2016):
Smoothed out some rough areas in the adventure part of the release.  We'll be continuing on with bug fix releases.

##### Major bug fixes
* Stopped zone corruption problem from adventure sites (caused crashes)
* Stopped adventure camps from being aged by the age of the world repeatedly
* Stopped certain site build orders from skipping the collapse check
* Stopped prisoners in goblin sites from starting no quarter fights with their rescuers
* Made people that join you stop personal/shared activities that might interfere them from following you

##### Other bug fixes/tweaks
* Stopped felling of trees in the arena, so you wouldn't be teleported to a weird hidden region map
* Indicated child/baby state of prisoners during look etc.

***

### Release notes for 0.43.01 (May 9, 2016):
A new version number!  With the work order additions and adventurer-created sites, this one ended up with more new stuff and fewer bug fixes than expected, and my version calculator just tipped over at 0.43.  You can use the new 'b' site building option in adventure mode to create a site (outside the bounds of other sites).  For dwarf mode work orders, you can set conditions and details from the manager.  You can also create orders tied to specific shops from their workshop profiles.

A miscellaneous note: in order to retire at the adventurer sites you create, you'll need to name the site, create a main hall zone, and claim the hall during conversation (or while shouting to yourself).

Next up we'll be doing more bug fix releases to make sure we have a vaguely presentable DF before we disappear into a new compiler and 64 bits.

##### New stuff
* Ability to build up new sites in adv mode, either yourself or by assigning companions
* Ability to do carpentry in adv mode
* Ability to chop down trees in adv mode
* Ability to make stone axes in adv mode
* Ability to pull branches from trees in adv mode
* Can put start conditions on work orders (by amount of resources or dependence on other work orders)
* Can specify materials/images/etc. in work orders
* Can create work order from profile which is tied to specific workshop
* Can set maximum number of shops that a general work order can task at once
* Can set maximum number of general work orders per shop or disallow them by profession or altogether (note: this won't work for active old-save jobs)
* Allowed perpetual work orders
* Repeatable work orders, ability to set restart frequencies

##### Major bug fixes
* Stopped masterpiece trading from causing artisans to suffer effects of art defacement

##### Other bug fixes/tweaks
* Got rid of work order limit of 30 jobs
* Improved work order filtering (respect partial vs. full results etc.)
* Stopped work orders from taking more than one slot per workshop
* Stopped non-citizens from being charged for violating production orders
* Stopped mother from getting both her and spouse's miscarriage thought
* Refreshed material list when deleting uniform item
* XML export now has the exact site rectangle

## Credits & Special Thanks
 * [@andrewd18](https://github.com/andrewd18/) Andrew Dorney made the awesome linux LNP installer script
 * [@amfournda](https://github.com/amfournda/) Created a great gentoo fix script included in the pack
 * [@beaubouchard](https://github.com/BeauBouchard) Previous maintainer of this package
 * [@Captain Duck](https://www.youtube.com/playlist?list=PL0sBhCMFBvPlF7wG7OH-NFQKMeCQiS8aM) Just all around great guy, watch his Dwarf Fortress Tutorial series and subscribe!
 * [@CarterScottM](https://www.github.com/CarterScottM) Current maintainer of the Linux Pack
 * [@DanFritz](https://github.com/DanFritz/) His fork of Dwarf Therapist was used to compile DT with qt4
 * [@Daveralph](https://github.com/daveralph1234/LazyNewbPack/) continued working on LNP after Dricus
 * [@Dricus](https://github.com/Dricus)   Dirk Groot is the creator of the cross platform LNP port
 * [@Dwimenor](https://github.com/Dwimenor/) Created a workaround for LNP, as well as providing linux support
 * [@fricy](https://github.com/fricy/) Maintains the MacNewbie pack Reborn as well as supporting essential gaphic repo
 * [@Hello71](https://github.com/Hello71) Hello71's fork of Dwarf Therapist was used in previous versions of the pack
 * [@Japa](http://www.bay12forums.com/smf/index.php?topic=146473.0) Creator/maintainer of Armok Vision
 * [@joelpt](http://www.joelpt.net/quickfort/) Joel Thornton Created Quickfort 2.x
 * [@lethosor](https://github.com/lethosor) Works on DFhack, DFwiki, and maintainer of the LNP
 * [@LucasUP](https://github.com/LucasUP/) Lucas Paquette made the original Windows LNP
 * [@miffedmap](https://github.com/miffedmap) Actively perfecting cross distro compatibility
 * [@mifki](https://github.com/mifki) Text Will Be Text dfmultiscroll and webfort
 * [@PeridexisErrant](http://www.bay12forums.com/smf/index.php?topic=126076.0) Maintains the Windows Pack
 * [@Pidgeot](https://bitbucket.org/Pidgeot/python-lnp/) Michael is a Founding developer of PyLNP
 * [@splintermind](https://github.com/splintermind/) Josh, part time wizard works dilligently on Dwarf Therapist
 * [@Zweistein](http://zweistein.cz/) Created Soundsense, enriching the game with awesome sound packages!


If I forgot people, please let me know and I'll include them in the list.
