require_relative "isbn_valid.rb"
require "minitest/autorun"

class ISBN_test < Minitest::Test

	
	
	def test_to_remove_dashes_spaces
      assert_equal("1234567890", remove_dashes_spaces("123-4567-890"))
	  assert_equal("1237362781", remove_dashes_spaces("123-7362 781"))
    end
    
	
	def test_for_X_in_ISBN
	 assert_equal(["1","2","3","4","5","6","7","8","9","10"], checkdigit_contains_X(["1","2","3","4","5","6","7","8","9","x"]))
	 assert_equal(["1","2","3","3","6","2","7","8","1"], checkdigit_contains_X(["1","2","3","3","6","2","7","8","1"]))
	end
	
	def test_for_only_numeric_characters
		assert_equal(true, only_numeric_characters(["1","2","3","4","5","6","7","8","9","10"]))
		assert_equal(false, only_numeric_characters(["a","b","c","6","7","z","8","9","7","10"]))
	end
	
	def test_for_ten_character_math
	 assert_equal(true, ten_character_math([1,2,3,4,3,6,7,8,8,2]))
	  assert_equal(false, ten_character_math([1,2,3,4,3,6,7,8,8,1]))
	end
    
	def test_for_thirteen_character_math
	  assert_equal(true, thirteen_character_math([9,7,8,0,3,8,5,5,2,1,6,8,0]))
	  assert_equal(false, thirteen_character_math([7,8,0,6,7,0,0,2,0,4,8,5]))
	  assert_equal(false, thirteen_character_math([1,3,4,5,6,7,8,9,1,1,1,1]))
	  assert_equal(true, thirteen_character_math([9,7,8,0,4,7,0,0,5,9,0,2,9]))
	end
	
	#def test_valid_isbn
	  # assert_equal(true, isbn_valid?("0471958697"))
	  # assert_equal(true, isbn_valid?("0-321-14653-0"))
	  # assert_equal(false, isbn_valid?("877195869x"))
	  # assert_equal(true, isbn_valid?("9780470059029"))
	  # assert_equal(true, isbn_valid?("978-0-13-149505-0"))
	  # assert_equal(false, isbn_valid?("4780470059029"))
  # end
		
end