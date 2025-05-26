# Glove80 Sidecar Trackball

### Overview

A 3D printed trackball designed to fit into the sidecar module of the [MoErgo Glove80 keyboard](https://www.moergo.com/).  The trackball uses the internals of a [Logitech Ergo M575](https://www.logitech.com/en-us/products/mice/m575-ergo-wireless-trackball.html) and can fit any size trackball from 34 mm, which is what the M575 uses, up to 55 mm. (Note that I'm not affiliated with MoErgo or Logitech in any way.)

![Photo of the completed trackball showing the buttons](/images/overview1.jpg)

### Features

- All of the M575's buttons and the mouse wheel are fully functional.  They're placed outside outside of the Glove80's thumb cluster and are intended to be operated by your right thumb.  If you don't want to use them, the Glove80 allows you to configure keyboard keypresses to act as mouse clicks.
- The connection button is accessible on the side of the trackball, which allows you to toggle between a Bluetooth connection and the USB receiver.  The connection light is also visible next to the button: blue for Bluetooth, white for USB.
- The trackball has an adjustable foot for tenting.

### Notes

There are six plates in the 3MF file, but don't print all of them!  Print the first plate ("Main body") in whatever color you want for the body.  Print the second plate, which contains the cover for the connection light, in a translucent filament.  (It's only about 0.1 g of filament, so it's a very, very fast print.)  Then print **one** of the remaining plates, depending on what size trackball you're planning on using.

I printed most of the parts in PLA or PLA+, so that's what the tolerances are set for.  I printed the connection light cover in PETG, but you could use translucent PLA instead if desired.  For the foot, I used TPU for the bottom few layers (to give it more grip) and PETG for the rest, but PLA/PLA+ will work fine there as well.  The entire trackball could be likely printed in PETG if you wanted, altough you'd probably need some minor tweaks: You'll likely need to increase the number of walls when printing the mouse button shell to give it more rigidity, and the screw holes may be a bit snug as well.

Assembly instructions are below.  The assembly will require a bit of soldering to attach new battery terminals.  You'll also need to remove the existing battery terminals, but that can be accomplished with some tin snips or something similar if you don't want to worry about desoldering.

This design mounts the mouse wheel upside-down, which was necessary to arrange the mouse buttons comfortably since they're on the same PCB.  Your OS should have an option for inverting the mouse wheel if you want it to work normally.

When removing the supports from the mouse button shell, be careful not to damage the buttons.  The tip of the left mouse button can be a bit fragile.

You can get some cool patterns around the trackball if you adjust the bottom surface pattern when printing the top shell.  Archimedean Chords and Octogram Sprial both give nice results.

### Required materials

- Logitech Ergo M575 trackball
- a larger trackball (optional - you can use the 34 mm ball from the M575 if you want)
- 20x M2.5x8mm screws, button head
- 1x M4 x 40mm threaded rod
- 1x M4 heat set threaded insert, 6 mm OD, 8 mm length
- 3x 2.5mm bearing balls (I used zirconium oxide G5 balls)
- electrical wire, about 5" - 7" / 20 - 30 cm each of red and black 22 AWG hook up wire
- solder
- 2x flat cables, 10 pins 0.5 mm pitch, 150 mm length, A type ([these](https://www.amazon.com/dp/B07RWTFSG7) are what I used)
- AA battery contact plates, 13.5 mm x 11.5 mm
![Battery contact plates](/images/battery_terminals.jpg)

### Required tools

- soldering iron
- small Philips head (#1) screw driver for the screws holding the trackball together
- small screw driver for the M2.5 screws (if they're hex head, you'll need a 1.5 mm hex wrench)
- sandpaper and/or needle files
- small pliers
- prying and spudging tools.  These are optional, but they'll come in handy when disassembling the trackball (I used [these](https://www.ifixit.com/products/prying-and-opening-tool-assortment) for that) and for getting supports out from between the mouse buttons (I used [this](https://www.ifixit.com/products/jimmy))

You'll also need one or more of
- desoldering wick
- solder sucker
- tin snips
- wire cutter

which we'll use to remove the existing battery terminal wires from the M575's PCB.

### Assembly instructions

1. On the side wall (the piece with the PCB mount), push the connection button a few times to make sure that the hinge separates from the wall.
1. Screw the translucent connection light cover into the side wall.
1. Insert the clips into the small slots in the side wall.  All of the clips and slots are identical so it doesn't matter which one goes where, but make sure that the clips all face inwards.  The fit for the clips should be quite snug; you can sand the edges of the clips a bit if they won't go in.  I'd recommend adding a tiny bit of CA glue to the slots before inserting the clips to make sure that they're secure, since the clips are the only thing that will hold the main PCB in place.
![Side wall](/images/side_wall_interior.jpg)
1. Sand down any printed seams in the interior of the trackball holder.  There's only about 0.5 mm of clearance between the trackball and the holder, so we don't want any seams high enough to interfere with the trackball movement.  I did quick passes with 150, 400, and 1500 grit sand papers, but you'd be fine without the 1500 grit.
1. Insert the mount for the sensor PCB into the bottom of the trackball holder.  This should be a very snug fit.  At least with my print, I didn't need any glue to hold things in place, but you can use some around the edges if the fit is a bit loose.  If it's too snug, sand the PCB mount a bit.  Be careful not to break the small pegs on the PCB mount while you're pushing it in.
![Sensor PCB mount](/images/sensor_mount.jpg)
1. Make sure that the Logitech USB receiver fits snugly into the compartment in the rear wall (above the battery compartment).  If it's too snug, sand the compartment a bit to enlarge it.
1. Install the heat set threaded insert into the bottom of the battery compartment.  Make sure it sits flush with the bottom.
![Threaded insert for foot](/images/threaded_insert_for_foot.jpg)
1. Completely disassemble to M575 trackball.  I followed the first six and a half minutes of [this teardown video](https://www.youtube.com/watch?v=4YsJPcs5skE).  (After six and a half minutes, the video shows how to reassemble the trackball, which we won't be doing.)  A few additional details:
    - Turn off the trackball's power switch **and** take out the battery before you disassemble it.  We want the power switch off so that we know what position it should be in when we reinstall it later.
    - **As soon as you remove the main PCB, take out the power switch.**  It's the small plastic piece with red and green on the underside that's shown at 5:18 in the video.  It'll come right out if you flip the bottom over; the PCB was the only thing holding it in place.  If you forget to remove this piece, it'll probably fall out the next time you move the M575 bottom piece and then you'll need to go hunting for it on the floor.
    - You'll need to remove the trackball sensor PCB from the bottom of the small "cup" that the trackball sits in.  That's not shown in the video, but it's easy to remove: just unscrew the two screws holding it in place and lift it up.  (Keep those screws.  We'll need them later.)
    - When you're unplugging the flat cables, note that the blue side of the cable faces _away_ from the contacts; you'll need to plug in the longer cables the same way when you're re-assembling the trackball.  Also, at least on my model, the plugs on the sensor PCB and the mouse button PCB have a small black flap that needs to be flipped up to insert or remove the cable.  If you forget to open them, they'll probably pop open on their own when you pull on the cable, which is fine, but be aware that you'll need to close them after you plug the new cables in.  On the other hand, the plugs on the main PCB (the one with the battery) didn't have any flaps; you just pull the cable out and push it back in.

    You'll need the following parts of the M575 for your new Glove80 trackball:
    - the main PCB (the one with the battery)
    - the sensor PCB (the one that was under the trackall)
    - the mouse buttons PCB
    - the two mounting screws from the sensor PCB (but *not* the screws used to hold the trackball "cup" down)
    - the three mounting screws from the mouse buttons PCB  (i.e. the screws used to sandwich the PCB between the mouse buttons and the black plastic piece)
    - the power switch (the small plastic piece with red and green on it)
    ![connection button](/images/connection_button.jpg)

    Everything else can be set aside.
1. Remove the battery wires/mount from the main PCB.
    - If you want to desolder the wires, you'll probably need to sand the solder globs on the back of the board.  At least on mine, there was some sort of soldering-iron-resistant coating applied.  After that, you can use a desoldering wick and/or a solder sucker.  You'll probably want to add a bit of flux or fresh solder to the factory solder so that it'll flow more easily.
    - If you don't want to desolder the wires (or if you can get up enough of the factory solder), you can instead clip the wires using tin snips or something similar.
1. Solder new wires onto the main PCB where the battery wires had been.  Some important notes:
    - **You'll probably have an easier time mounting the PCB if you solder the wires so that they're going down,** not to the left like I show in the photo.  If you solder them the way I did, you'll need to make sure that they don't sit in between the board and the mounts, which will prevent the clips from catching.
    - If you clipped the battery wires instead of desoldering them, you can solder the wires onto the PCB glob on the back of the board, **but make sure you sand the globs first** to remove the coating.
![Soldering](/images/soldering.jpg)
1. Solder the battery contact plates onto the other ends of the wires.  Make sure that the positive and negative terminals attach to the correct spots on the board.  See the picture if you can't remember what went where.
![New battery terminals](/images/new_battery_terminals.jpg)
1. Place the side wall (the piece with the main PCB mount on it) flat on a table and insert the power switch (the small plastic piece with red and green on it).  Make sure that the power switch is in the off position: the red should be visible from the underside of the wall.
![connection button in place](/images/connection_button_in_place.jpg)
1. Mount the main PCB on the side wall.  **Make sure you've placed the power switch in position first** (i.e. the previous step).  You'll likely need to pull back on the clips one at a time to get the PCB past them.
1. Mount the sensor PCB to the underside of the trackball holder, using the mounting screws from the M575.
1. Plug in one end of a 150 mm flat cable to the sensor PCB.  Flip down the black flap on the plug to hold the cable in place.
![Sensor PCB](/images/sensor_pcb.jpg)
1. Place the trackball holder into the bottom shell with the cable coming out from the open end of the trackball holder.  Screw the trackball holder into the bottom shell using three of the M2.5x8mm screws.  The screw heads should fit entirely inside of the screw holes so that the bottom shell can still sit flat on the table.  Make sure you don't pinch the cable in between the trackball holder and the bottom shell.
![Attaching trackball holder](/images/attaching_trackball_holder.jpg)
1. Attach the mouse buttons back wall to the bottom shell using three of the M2.5x8mm screws.
![Mouse button PCB](/images/button_back_wall.jpg)
1. Take the second 150 mm flat cable and plug it into the mouse buttons PCB, then flip down the black flap on the plug to hold the cable in place.
1. Mount the mouse buttons PCB on the mouse buttons back wall.  Then place the mouse buttons upper PCB holder over the PCB and screw in the three mounting screws from the M575.
1. Slide the end of the flat cable through the small slot in the mouse button back wall.
![Mouse button PCB](/images/button_pcb.jpg)
1. Plug the ends of both flat cables into the main PCB.  Make sure to plug them into the correct spot: the cable coming from the mouse buttons connects to the plug towards the front, i.e., the plug that will be closer to the mouse buttons after we assembly the trackball.
1. Attach the side wall to the case and hold it in place with three M2.5x8mm screws: two at the front, and one from the bottom.
![Adding side wall](/images/adding_side_wall.jpg)
![Adding side wall - outside](/images/adding_side_wall_outside.jpg)
1. Insert the battery contact plates into the rear wall.  They slide into the small slots at the top of the battery compartment.  The plate with the spring goes into the larger opening.  If your contact plates have little dimples on them, you might need to squish the dimples a bit with a pair of pliers to get them to slide in.
1. Attach the rear wall to the rest of the case with five M2.5x8mm screws.  Three screws come up from the bottom, one goes through the top rear of the side wall, and one screws into the top of the bottom shell near the sidecar mounting bracket.
![Adding rear wall](/images/adding_rear_wall.jpg)
1. Attach the mouse button shell to the mouse button back wall with four M2.5x8mm screws: three screws go in from the back side of the mouse buttons back wall and one screw goes in from the bottom side of the mouse button shell.
1. Press the static bearings (i.e the 2.5 mm bearing balls) into the three small holes in the interior of the trackball holder.  The best technique I found is to hold the trackball case at a slight angle so that a hole is facing straight up (i.e completely vertical).  Then place the bearing near the hole, tilt the case a tiny bit to get it closer to the hole, and then use your thumb to press the bearing in all the way.  You can use a very tiny bit of CA glue if you're worried about the bearings falling out.  I didn't use any glue and haven't had any issues, although I haven't tried traveling with the trackball yet.
1. Place the trackball itself into the trackball holder.
1. Place the top shell over the trackball, press the top shell down so that it's securely seated, and attach it with four M2.5x8mm screws.
![Adding top shell](/images/adding_top_shell.jpg)
1. Put a battery into the battery compartment and slide the battery compartment door on from the bottom until it clicks into place.  (To remove the door later, press on the arrow and slide it down.)
1. Make sure that your trackball works correctly.  Connect it to your computer and test cursor movement and all of the buttons.
1. Screw the threaded rod into the foot, and then screw it into the threaded insert.  You can adjust the tenting of the keyboard and trackball by unscrewing/screwing in the foot, just like the feet on the Glove80.
![foot](/images/foot.jpg)
1. Screw the completed trackball into the right half of your Glove80 using the last two M2.5x8mm screws.  (Take the trackball itself out while you're screwing things in.)

### Additional pictures

![Photo of the completed trackball showing the power switch and connection light](/images/overview2.jpg)
![Photo of the completed trackball from above](/images/overview3.jpg)
![Rear - battery compartment open](/images/rear_open.jpg)
![Rear - battery compartment closed](/images/rear_closed.jpg)

### License

This work is licensed under [CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/)