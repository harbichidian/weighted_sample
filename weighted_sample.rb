class Hash
	def weighted_sample(iterations = 1)
		results = iterations.times.collect do
			target = rand * self.values.reduce(:+)
			key, value = self.detect{ |k, v| target -= v; target < 0 }
			key
		end
		if iterations == 1 then results[0] else results end
	end
end
