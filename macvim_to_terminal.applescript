on execute_cmd_in_terminal_app(cmd)
	using terms from application "Terminal"
		tell application "Terminal"
			set all_usable_windows to every window whose (closeable is true and visible is true)
			
			set window_count to count of all_usable_windows
			if window_count is 0 then
				# create a new window and execute cmd in it
				do script cmd
			else if window_count is greater than 1 then
				# TODO: Present a list of window names asking the user to choose which one to execute cmd in
				display dialog "With more than one window open, not sure which one to run cmd in. :("
			else
				# only one window open
				do script cmd in (item 1 of all_usable_windows)
			end if
		end tell
	end using terms from
end execute_cmd_in_terminal_app