require File.expand_path('../system', __FILE__)

begin
	require 'rubygems'
rescue LoadError
	System::PkgMngr.install 'rubygems'
end