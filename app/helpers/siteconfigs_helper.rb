module SiteconfigsHelper
	# @@config = Hash.new

    def RefreshCFG()
		ls = Hash.new
		Siteconfig.all.each do |x|
			# puts x.name.to_sym
			ls[x.name.to_sym] = raw(x.value)
		end
		@config = ls
	end

	def CFG(name)
		if @config.blank?
			RefreshCFG()
		end
		@config[name]
		# raw(Siteconfig.all.find_by(name: name).value)
	
	end
end
