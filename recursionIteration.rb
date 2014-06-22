def fibonacci7(n)
  if n == 0
    return 0
  elsif n == 1
    return 1
  else
    return fibonacci7(n - 1) + fibonacci7(n - 2)
  end
end

def fibonacci8(n)
  if n == 0
    return 0
  else
    x = 0
    y = 1
    for i in 1..(n - 1)
      z = x + y
      x = y
      y = z
    end
  end
  return y
end

def mpower(b, n, m)
  if n == 0
    return 1
  elsif n.even?
    return mpower(b, (n/2), m)**2 % m
  else
    return (mpower(b, (n/2).floor, m)**2 % m * b % m) % m
  end
end

# implementation for algorithm 1
def base(n, b)
  q = n
  a = []
  while q != 0
    a.push(q % b)
    q = (q/b).floor
  end
  return a
end

# implementation for algorithm 5
def mod(b, n, m)
  a = base(n, 2)
  x = 1
  pow = b % m
  for i in (0..a.length)
    if (a[i] == 1)
      x = (x * pow) % m
    end
    pow = (pow * pow) % m
  end
  return x
end

puts "Please enter the number to be used in the Fibonacci formula:"
number = gets.chomp

startTime7 = Time.now
answer7 = fibonacci7(number.to_i)
endTime7 = Time.now

puts "Fibonacci Recursive answer for " + number.to_s + " is " + answer7.to_s
puts "Time: " + (endTime7 - startTime7).to_s + " seconds\n"

startTime8 = Time.now
answer8 = fibonacci8(number.to_i)
endTime8 = Time.now

puts "Fibonacci Iterative answer for " + number.to_s + " is " + answer8.to_s
puts "Time: " + (endTime8 - startTime8).to_s + " seconds\n\n"

puts "Recursive Modular Exponentiation:"
startTimeModPower = Time.now
puts "The answer for 7^644 mod 645 recursively is " + mpower(7, 644, 645).to_s
puts "The answer for 11^644 mod 645 recursively is " + mpower(11, 644, 645).to_s
puts "The answer for 3^2003 mod 99 recursively is " + mpower(3, 2003, 99).to_s
puts "The answer for 123^1001 mod 101 recursively is " + mpower(123, 1001, 101).to_s
endTimeModPower = Time.now
puts "Recursive total time: " + (endTimeModPower - startTimeModPower).to_s + " seconds\n\n"

puts "Iterative Modular Exponentiation:"
startTimeMod = Time.now
puts "The answer for 7^644 mod 645 iteratively is " + mod(7, 644, 645).to_s
puts "The answer for 11^644 mod 645 iteratively is " + mod(11, 644, 645).to_s
puts "The answer for 3^2003 mod 99 iteratively is " + mod(3, 2003, 99).to_s
puts "The answer for 123^1001 mod 101 iteratively is " + mod(123, 1001, 101).to_s
endTimeMod = Time.now
puts "Iterative total time: " + (endTimeMod - startTimeMod).to_s + " seconds\n\n"