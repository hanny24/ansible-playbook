function __taskwarrior_impl
	set active_context (t context | grep yes | cut -d ' ' -f 1)
	if not [ -z $active_context ]
		echo "+$active_context"
	end
	for element in $argv
		if echo $element | grep '^++' >/dev/null
			set tmp (string sub -s 3 "$element")
			echo "+$tmp"
			echo "$tmp"
		else if echo $element | grep '^@' >/dev/null
			set tmp (string sub -s 2 "$element")
			if echo $element | grep ':' >/dev/null
				set tmp2 (string split ":" "$tmp")
				echo "project:$tmp2[1]"
				echo "module:$tmp2[2]"
			else
				echo "project:$tmp"
			end
		else
			echo "$element"
		end
	end
end

function ta
	set args (__taskwarrior_impl $argv)
	task add $args
end

function tlg
	set args (__taskwarrior_impl $argv)
	task log $args
end
