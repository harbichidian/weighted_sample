class Hash
	def weighted_sample
		target = rand * self.values.reduce(:+)
		key, value = self.detect{ |key, value| target -= value; target < 0 }
		return key
	end
end
