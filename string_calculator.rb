class StringCalculator
    def self.add(numbers)
      
      return 0 if numbers.empty?
  
      delimiter = ','
      if numbers.start_with?('//')
        custom_delimiter, numbers = numbers.split("\n", 2)
        delimiter = custom_delimiter[2..-1]
      end
  
      numbers = numbers.gsub("\n", delimiter)
      
      # Check if input ends with comma
      raise "Invalid input" if numbers.end_with?(delimiter)
      
      # Check negative number in string
      xyz =  false
      temp = ""
      numbers.split(delimiter).map do |num|
        num = num.to_i
        if num.negative?
          xyz = true 
          temp = temp + " " + num.to_s + ","
        end
        num
        temp
      end
      raise "negative numbers not allowed:" + temp.chop  if xyz

      # Sum of integer number in array
      final = 0
      numbers.split(delimiter).map.each{|a| final = final + a.to_i}
      final
    end
  end