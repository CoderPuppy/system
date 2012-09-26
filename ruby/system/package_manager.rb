module System
	class PackageManager
		@pkg_mngrs = []
		
		class << self
			def install(*pkgs)
				find.install *pkgs
			end

			def remove(*pkgs)
				find.remove *pkgs
			end

			def register(pkg_mngr)
				@pkg_mngrs << pkg_mngr
			end

			private

				def find
					@pkg_mngr ||= @pkg_mngrs.detect &:available?
				end
		end

		attr_reader :cmd

		def initialize(cmd, cmds)
			self.class.register self

			@cmd = cmd.to_s
			@cmds = cmds.map &:to_s

			@cmds.each do |cmd|
				class << self; self; end.send(:define_method, cmd.to_sym) do |*pkgs|
					run cmd, *pkgs
				end
			end
		end

		def available?
			system [ 'which', @cmd.shellescape ].shelljoin + '>/dev/null'
			$? == 0 ? true : false
		end

		def cmds
			@cmds.dup
		end

		def run(cmd, *pkgs)
			raise ArgumentError, "Unknown command: #{cmd.inspect}" unless @cmds.include? cmd

			system @cmd, cmd.to_s, *pkgs.map(&:to_s)
		end

		private

			def find
				@path ||= `#{[ 'which', @cmd.shellescape ].shelljoin}`
			end

		Aptitude = new 'aptitude', %w[install remove]
		AptGet = new 'apt-get', %w[install remove]
	end

	PkgMngr = PackageManager
end