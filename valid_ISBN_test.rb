require_relative "valid_ISBN.rb"
require "minitest/autorun"

class ISBN_test < Minitest::Test

	def test_for_enough_characters
	  assert_equal(true, valid_ISBN(1234567890))
	  assert_equal(true, valid_ISBN(2345678901234))
	  assert_equal(false, valid_ISBN(234567890123456))
	end
	
	def test_to_remove_dashes
      assert_equal(true, valid_ISBN("123-4567-890"))
	  assert_equal(true, valid_ISBN("123-7362-781"))
	  assert_equal(false, valid_ISBN("123-362-781"))
    end
    
    def test_to_remove_spaces
      assert_equal(true, valid_ISBN("123 4567 890"))
	  assert_equal(true, valid_ISBN("123 7362 781"))
    end 
	
	def test_for_X_in_ISBN
	  assert_equal(true, checkdigit_contains_X('123456789x'))
	  assert_equal(false, checkdigit_contains_X("123-362-781"))
	end
	
	def test_for_ten_character_math
	  assert_equal(true, ten_character_math([7,4,2,1,3,9,4,7,6,1]))
	  assert_equal(true, ten_character_math([1,2,3,4,3,6,7,8,8,2]))
	  assert_equal(false, ten_character_math([1,2,3,4,3,6,7,8,8,1]))
	end
    
	def test_for_thirteen_character_math
	  assert_equal(true, thirteen_character_math([9,7,8,0,3,8,5,5,2,1,6,8,0]))
	  assert_equal(false, thirteen_character_math([7,8,0,6,7,0,0,2,0,4,8,5]))
	  assert_equal(false, thirteen_character_math([1,3,4,5,6,7,8,9,1,1,1,1]))
	  assert_equal(true, thirteen_character_math([9,7,8,0,4,7,0,0,5,9,0,2,9]))
	end
end