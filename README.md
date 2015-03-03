# Fingerpad2
This project is a second attempt at making an arrow-keyless interface to interact with native OS X apps. The source code for the original is available [here](https://github.com/vgmoose/fingerpad).

## Purpose
Arrow keys are annoying. Like super annoying. Maybe they are more annoying to some people than they are to others. Maybe they are only annoying to me specifically. But the bottom line is, they have at the very least the potential to be very annoying. Fingerpad2 aims to solve this problem.

## How to Use
Download the .app file and install it to ~/Applications, or compile it from source. After running the app, the main interface will pop up, which is pictured below:

![interface of fpad](http://i.imgur.com/S9lFcHQ.png)

The slider adjusts the proportions of the hoverable areas. The checkbox allows for clicks to be intercepted as key presses as well. The window can also be resized at this time to either fit over the application or to be a more convenient size. After hitting the "Start" button in the center, Fingerpad2 will start watching your mouse to see when it hovers over the red/blue areas.

Once it detects the mouse move over one of the areas, the keys are sent to the foreground application. Fingerpad2 will hover on top of all other windows while it has been activated, so you are able to still see the "controller" while you interact with your clunky arrow-key utilizing app.
