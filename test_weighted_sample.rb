require_relative 'weighted_sample'
require 'test/unit'

class TestSimpleHash < Test::Unit::TestCase
	def setup
		@h = {a:1, b:1, c:2}
	end
	
	def test_basic_functionality
		assert @h.has_key? @h.weighted_sample
	end
	
	def test_fails_on_nonnumeric_weight
		@h[:d] = "string"
		assert_raise(TypeError){ @h.weighted_sample }
	end
	
	def test_key_type_agnostic
		@h.merge({'foobar' => 1, Object.new => 2, /f[nj]ord/ => 2})
		assert_nothing_raised{ @h.weighted_sample }
		assert @h.has_key? @h.weighted_sample
	end
end
