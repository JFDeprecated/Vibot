# Oscalite-Vibot

Oscalite Vibot is an application coded in AppleScript which perform commands from a website’s title.

**Procedures:**

1 - The user launches the application. (For first launch)

2 - Check if application is already in the login items.

3 - If not, add the application itself as a login item and `delay(30)`.

4 - Check the website title of the website if it is any of the commands

5 - Perform the commands if true.

6 - Wait for `delay(60)` until next check and repeat from step 4.

**Commands:**

`logout` - log out from the computer

`shutdown` - shut down the computer

`sleep` - turn computer to sleep mode

`desktop` - delete all items in Desktop folder

`document` - delete all items in Documents folder

`uninstall` - uninstall Oscalite Vibot Wireless


**Please note that the "add to login items" feature may not work if you change the application file name without changing `”Oscalite Vibot Wireless”` in the line `my checkLoginItems("Oscalite Vibot", my_path)`.**

Developed by Jordan Fung.
