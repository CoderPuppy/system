file "install.sh" => [ "sh/pkg_mng.sh", "sh/install.sh" ] do
	File.write(File.expand_path('../install.sh', __FILE__), [ File.read(File.expand_path("../sh/pkg_mng.sh", __FILE__)), File.read(File.expand_path("../sh/install.sh", __FILE__)) ].join("\n"))
end