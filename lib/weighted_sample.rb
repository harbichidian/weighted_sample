class Hash
	# Returns a random key from the hash. Keys with greater values come up more often.
	# If _iterations_ is 1, returns a single key. If _iterations_ is greater than 1, returns an array.
	# 
	# All values should be numeric, as the method builds a "stack" of keys by adding the values together and subtracting as it searches.
	def weighted_sample(iterations = 1)
		results = iterations.times.collect do
			target = rand * self.values.reduce(:+)
			key, value = self.detect{ |k, v| target -= v; target < 0 }
			key
		end
		if iterations == 1 then results[0] else results end
	end
end
