def valid_ISBN(number)
	number = number.to_s 
	
		if number.include? " "
		  number.delete! ' '
		elsif number.include? "-"
		  number.delete! '-'
		end
		
		number.length == 10 || number.length == 13
end

def checkdigit_contains_X(number)
	number_array = number.split ""
		if number_array[9] == "X" || number_array[9] == "x"
		  number_array[9] = 10
		end
	   number_array[9] == 10
end

def only_numeric_characters(number)
    n = number.join("")
    if n =~ /\D/
       return true
    else
       return false
    end
end 
	 

def ten_character_math(any_array)
 	sum = 0
 		if any_array.count == 10
		  any_array.each_with_index do |value, index_position|
 		  break if index_position == 9
		  sum += value * (index_position + 1)
		end
		end
		any_array[9] == sum % 11
end

	
def thirteen_character_math(any_array)
 	sum = 0
	check_digit = 0
		if any_array.count == 13
	
		any_array.each_with_index do |value, index_position|
		
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
		
	end
		any_array[12] == check_digit
end