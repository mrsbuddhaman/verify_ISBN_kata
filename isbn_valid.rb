def isbn_valid?(any_string)
    no_dashes_spaces = remove_dashes_spaces(any_string)
	no_dashes_spaces_array = no_dashes_spaces.split("")
		if no_dashes_spaces_array.length == 10
		   ten_digit_array = checkdigit_contains_X(no_dashes_spaces_array)
		   
			   if only_numeric_characters(ten_digit_array) == true
			      ten_character_math(ten_digit_array)
			   else @output = false
			   end		

		elsif no_dashes_spaces_array.length == 13
		   
		      if only_numeric_characters(no_dashes_spaces_array) == true
		         thirteen_character_math(no_dashes_spaces_array)
			  else @output = false
		      end
			  
		else
		@output = false

		end
	
	
		
end


def remove_dashes_spaces (isbn_number)
	disallowed_characters = ["-", " "]
	disallowed_characters.each do |c|
	isbn_number.delete! c if isbn_number.include? c
	end
		isbn_number
end

def checkdigit_contains_X(number)
	
		if number[9] == "X" || number[9] == "x"
		 number[9] = "10"
		end
	     number
	   
end

def only_numeric_characters(any_array)
	any_array.each do |v|
	  m =/\d/.match(v)
	  m2 = /\d\d/.match(v)
		if m || m2
		return true
		else return false
		end
	end
	
end

def remove_extra_characters(number_array)
    number_array.slice!(0)
    number_array.slice!(-1)
    number_array.slice!(-1)
	
	number_array
end

def ten_character_math(any_array)
	new_array = []
	  any_array.each do |value|
    new_array<<value.to_i
      end
	
 	sum = 0
 		
	 new_array.each_with_index do |value, index_position|
 		  break if index_position == 9
		  sum += value * (index_position + 1)
	  end
		check_digit = sum % 11
		 if any_array[9] == check_digit
          @output = true
         else
          @output = false
         end 
	  

	end
	
def thirteen_character_math(any_array)
	new_array = []
	  any_array.each do |value|
	new_array<<value.to_i  
      end
	  
 	sum = 0
	check_digit = 0
		
	
	new_array.each_with_index do |value, index_position|
		
		break if index_position == 12
		
			if index_position % 2 == 0 
			 sum += value * 1
			else
			  sum += value * 3
			end
	end	
			sum = sum % 10
			check_digit = 10 - sum
			
			if check_digit == 10
				check_digit = 0
			end		
		if any_array[12] == check_digit
            @output = true
        else
            @output = false
        end 	
end
	
