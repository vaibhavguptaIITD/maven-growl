

osascript <<EOD
tell application "System Events"
	set isRunning to (count of (every process whose bundle identifier is "com.Growl.GrowlHelperApp")) > 0
end tell

if isRunning then
	tell application id "com.Growl.GrowlHelperApp"
		-- Make a list of all the notification types 
		-- that this script will ever send:
		set the allNotificationsList to ¬
			{"Build Success", "Build Fail"}
		
		-- Make a list of the notifications 
		-- that will be enabled by default.      
		-- Those not enabled by default can be enabled later 
		-- in the 'Applications' tab of the Growl preferences.
		set the enabledNotificationsList to ¬
			{"Build Success", "Build Fail"}
		
		-- Register our script with growl.
		-- You can optionally (as here) set a default icon 
		-- for this script's notifications.
		register as application ¬
			"Maven Build" all notifications allNotificationsList ¬
			default notifications enabledNotificationsList ¬
			icon of application "Script Editor"
		
		--       Send a Notification...
		notify with name ¬
			"Build Success" title ¬
			"Build Success" description ¬
			"Build Success" application name "Maven Build"		
	end tell
end if
EOD