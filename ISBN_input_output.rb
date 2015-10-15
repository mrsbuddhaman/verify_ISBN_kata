require_relative "isbn_valid.rb"

def create_output_file
    file_original = File.open('input_isbn_file.csv', "r")
    file_new = File.open('isbn_output.csv', "w")
    
    file_original.each do |row|
      isbn_valid?(row)
        if @output == true
          file_new.puts row.chomp + ", valid"
        else
          file_new.puts row.chomp + ", invalid"
        end
    
    end     

	file_original.close
    file_new.close
    
end

create_output_file 