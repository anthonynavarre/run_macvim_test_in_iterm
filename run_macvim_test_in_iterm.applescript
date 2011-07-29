﻿script MacVimTerminal		property RUN_EM_ALL : "Run'em All!"	property ruby_file_path : missing value	property window_name : missing value	property file_path : missing value		on init()		set_ruby_path()		set_window_name()		set_file_path()		process_file()	end init		on set_ruby_path()		set my_path to (path to me as Unicode text)		tell application "Finder"			set my_parent to parent of alias my_path as string		end tell		set ruby_path to (my_parent & "read_file.rb")		set ruby_file_path to quoted form of POSIX path of ruby_path	end set_ruby_path		on set_window_name()		activate application "MacVim"		tell application "MacVim"			set window_name to name of window 1		end tell	end set_window_name		on set_file_path()		set the_parts to tidStuff(space, window_name)		set root_path to item -1 of the_parts		set file_path to item 1 of the_parts		set file_path to root_path & "/" & file_path	end set_file_path		on process_file()		if file_path contains "spec" or file_path contains "feature" then			set test_list to lines_to_choose_from_in_file(file_path)			set chosen_test_line_number to choose_test_from_test_list(test_list)			if chosen_test_line_number is false then return						set line_number to ""			if chosen_test_line_number is not RUN_EM_ALL then				set line_number to ":" & chosen_test_line_number			end if						if file_path contains "spec" then				set cmd to "bundle exec rspec" & space & file_path & line_number & space & "--drb"				run_cmd_in_iterm(cmd)			else				set cmd to "bundle exec cucumber -r features/" & space & file_path & line_number & space & "--drb"				run_cmd_in_iterm(cmd)			end if					end if	end process_file		on choose_test_from_test_list(test_list)		set test_list to {RUN_EM_ALL} & test_list		tell me to activate		set test_to_execute to choose from list test_list default items item 1 of test_list without multiple selections allowed				if test_to_execute is false then			return false		else			set test_to_execute to item 1 of test_to_execute			set line_number to item -1 of (tidStuff(":", test_to_execute))			return line_number		end if	end choose_test_from_test_list		on lines_to_choose_from_in_file(path)		set return_value to do shell script "ruby" & space & ruby_file_path & space & quoted form of path		return paragraphs of return_value	end lines_to_choose_from_in_file		on run_cmd_in_iterm(cmd)		tell application "iTerm"			tell current session of terminal 1				write text cmd			end tell		end tell	end run_cmd_in_iterm	end script#-----------------------------------------------------------------# Execution#-----------------------------------------------------------------tell MacVimTerminal to init()#-----------------------------------------------------------------# helpers#-----------------------------------------------------------------on tidStuff(paramHere, textHere)	set OLDtid to AppleScript's text item delimiters	set AppleScript's text item delimiters to paramHere	set theItems to text items of textHere	set AppleScript's text item delimiters to OLDtid	return theItemsend tidStuff