require 'mkmf'
require 'tmpdir'

# Since this is an explicit hack
create_makefile ''

bin = Gem.bindir()
temp = Dir.tmpdir()

# Place real binary in tmp path,
# if we put to bin path immediately, install process will try to use a dummy one
`EC_DEST=#{temp} EC_VERSION=0.0.1 sh install.sh`

# Execute in subprocess so post install would think we are finished
pid = fork do

	# Need to do this in order to trick post install that we are done
	$stdin.reopen  "/dev/null"
	$stdout.reopen "/dev/null"
	$stderr.reopen "/dev/null"

	# Replace dummy bin with a real one
	# "sleep" is need to give time for parent process to finish up
	exec("sleep 2 && mv #{temp}/ec #{bin}")
end

# Do it zombie style
Process.detach(pid)