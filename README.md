Qrecipe recipes viewer
=====================

Introduction
============
It is a recipes viewer for [Gourmet](https://github.com/thinkle/gourmet) recipes manager.
You can use Gourmet to insert your recipes and then Qrecipe to view it during cooking.

It uses QML so it is easy to use on touch devices. I use it on raspberry pi 3 with touchscreen.
You need to put Qt >= 5.10 on Raspberry pi and then you can deploy it with Qt creator.

When I started playing with this Qt 5 wasn't in raspibian repository. If it is use it.
I used [this tutorial](https://wiki.qt.io/RaspberryPi2EGLFS) to crosscompile Qt 5.10. But it is probably enough to just use precompiled [binaries](https://github.com/grisson2/qt-5.10.0-raspberry). Just make sure that EGLFS is enabled which makes sure that GUI will be drawing will be GPU accelerated. 

Localization is supported so it can be easily translated.
By default it has android blue material view. This can be changed in qtquickcontrols2.conf.
During recipe view ingredient amounts are automatically recalculated based on different yields.

Last thing to do is to copy gourmet database.

Screenshots
----------

![Main view](/screen/list_view.png)
![Recipe view](/screen/recipe_view.png)
![Searching](/screen/search.png)
