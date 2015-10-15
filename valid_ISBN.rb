def valid_ISBN(number)
	number = number.to_s 
	
		if number.include? " "
		  number.delete! ' '
		elsif number.include? "-"
		  number.delete! '-'
		else
		number
		end
		remove_extra_characters(number)
end

def remove_extra_characters(number)
    number_array = number.split ("")
    number_array.slice!(0)
    number_array.slice!(-1)
    number_array.slice!(-1)
    character_length(number_array)
end

def character_length(number)
    @number_array = number    
	if
       @number_array.length == 10
       checkdigit_contains_X(@number_array)
        if only_numeric_characters(@new_number) == true
         @output = false    
        else ten_character_math(@new_number)
        end
    elsif
        @number_array.length == 13
         if only_numeric_characters(@number_array) == true
          @output = false
        else thirteen_character_math(@number_array)
        end
    else
        @output =  false
    end 
end

def checkdigit_contains_X(number)
	
		if number[9] == "X" || number[9] == "x"
		 number[9] = 10
		end
	     @new_number = number
	     number[9] == 10
	   
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
	array = []
	  any_array.each do |value|
      array << value.to_i
      end
 	sum = 0
 		
	  array.each_with_index do |value, index_position|
 		  break if index_position == 9
		  sum += value * (index_position + 1)
	  end
		check_digit = sum % 11
		 if array[9] == check_digit
          @output = true
         else
          @output = false
         end 
		
end

	
def thirteen_character_math(any_array)
	array = []
	  any_array.each do |value|
       array << value.to_i
      end
 	sum = 0
	check_digit = 0
		
	
	array.each_with_index do |value, index_position|
		
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
		if array[12] == check_digit
            @output = true
        else
            @output = false
        end 	
end
		
