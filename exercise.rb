class Exercise

  # Assume that "str" is a sequence of words separated by spaces.
  # Return a string in which every word in "str" that exceeds 4 characters is replaced with "marklar".
  # If the word being replaced has a capital first letter, it should instead be replaced with "Marklar".
  def self.marklar(str)
    i = 0 # index of current character
    firstLetter = 0 # index of the first letter in the current word

    str.each_char do |char|

      # if the previous character is not a letter and the current character is a letter
      # then this is the start of the current word
      if !(/[[:alpha:]]/).match(str[i-1]) && (/[[:alpha:]]/).match(str[i])
        firstLetter = i
      end

      # if the next character is not a letter and the current character is a letter
      # then this is the end of the current word
      if !(/[[:alpha:]]/).match(str[i+1]) && (/[[:alpha:]]/).match(str[i])

        lastLetter = i # index of the last letter in the current word
        wordLength = lastLetter - firstLetter + 1 #current word length

        if wordLength > 4

          # check if the first character of the current word is a capital letter
          if (/[[:upper:]]/).match(str[firstLetter])
            marklarStr = "Marklar"
          else
            marklarStr = "marklar"
          end

          # replace current word with an empty string
          str[firstLetter,wordLength] = ""
          # insert the marklar string at the index where the current word starts
          str.insert(firstLetter,marklarStr)

          # adjust the index for the difference in length between the current word and marklar
          if marklarStr.length > wordLength
            i += marklarStr.length - wordLength
          elsif marklarStr.length < wordLength
            i -= wordLength - marklarStr.length
          end
          
        end

      end

      # increment the index by one
      i += 1
    end

    return str
  end

  # Return the sum of all even numbers in the Fibonacci sequence, up to
  # the "nth" term in the sequence
  # eg. the Fibonacci sequence up to 6 terms is (1, 1, 2, 3, 5, 8),
  # and the sum of its even numbers is (2 + 8) = 10
  def self.even_fibonacci(nth)
    i = 0 
    fibonacci = []
    sum = 0;

    while i < nth do
      if i === 0 || i === 1
        fibonacci += [1]
      else
        fibonacci += [fibonacci[i-1] + fibonacci[i-2]]
      end
      i += 1
    end

    fibonacci.each do |num|
      if num % 2 === 0
        sum += num
      end
    end

    return sum
  end

end
