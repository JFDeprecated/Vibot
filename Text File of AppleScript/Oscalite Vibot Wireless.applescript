-- Oscalite Vibot Wireless - Developed by Jordan Fung
-- Version 1.0W - July 15, 2015
-- Description: Coded in AppleScript. Control the user's Mac using website title.
-- Released under the GNU General Public License v3.0

-- Start of AppleScript

on checkLoginItems(appName, path)
	
	--Get all login items and store them as strings
	tell application "System Events"
		set allLoginItems to name of every login item as string
	end tell
	
	-- Check if the application exists in the login items
	if appName is in allLoginItems then
		-- Do nothing if true
		
	else
		set appPath to POSIX path of alias path
		
		-- Add a new login item if false
		tell application "System Events"
			make login item at end with properties {path:appPath, hidden:false}
			-- delay 30 seconds
			delay 30
		end tell
		
	end if
	
end checkLoginItems

-- Get the path of this application
set app_path to (path to me as string)

-- Call checkLoginItems
my checkLoginItems("Oscalite Vibot Wireless", app_path)

repeat
	
	-- Get the title of the website
	set title to do shell script "/usr/bin/curl 'http://www.URLtoCheck.com' | /usr/bin/awk '/<title>/' | /usr/bin/cut -d '>' -f 2 | /usr/bin/cut -d '<' -f 1"
	
	-- Check if it is any of the commands
	if title is "logout" then
		-- Log out the computer
		tell application "System Events"
			log out
		end tell
		
	else if title is "shutdown" then
		-- Shut down the computer if 
		tell application "System Events"
			shut down
		end tell
		
	else if title is "sleep" then
		-- Turn Mac to sleep mode
		tell application "Finder"
			sleep
		end tell
		
	else if title is "desktop" then
		-- Delete all item in Desktop folder
		tell application "Finder"
			delete (every item of folder (path to desktop folder))
		end tell
		
	else if title is "document" then
		-- Delete all item in Document folder
		tell application "Finder"
			delete (every item of folder (path to documents folder))
		end tell
		
	else if title is "uninstall" then
		-- Uninstall Oscalite Vibot
		tell application "Finder"
			delete (path to me)
		end tell
		
	end if
	
	-- Delay 60 seconds until next check
	delay 60
	
end repeat

--End of AppleScript