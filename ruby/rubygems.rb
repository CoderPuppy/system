require File.expand_path('../system', __FILE__)

print "Checking for Rubygems: "

begin
	require 'rubygems'

	puts "Yes"
rescue LoadError
	puts "No"

	System::PkgMngr.install 'rubygems'
end
