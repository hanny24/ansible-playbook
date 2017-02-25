function _run_fasd --on-event fish_preexec
	fasd --proc (fasd --sanitize $argv) > "/dev/null" 2>&1
end
