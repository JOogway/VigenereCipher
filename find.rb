class Find
  f = File.open('lab1Crypted.txt')
  x = f.gets.upcase.split(//)
  n = x.length
  first = []
  second = []
  half = n/2
  *alphabet = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','R','S','T','U','V','W','X','Y','Z']
  sum = 0
  def icm block,alfa,sum
    for i in 0..25
      fi = block.count(alfa[i])
      sigma = fi*(fi-1)
      sum =sum + sigma
    end
    n = block.length
    deno = n*(n-1)
    ic = (sum.to_f/deno.to_f).to_f.round(3)
    puts ic
    sum = 0
  end
  c = Find.new

  first.push(x[0])
  for i in 1..half
    first.push(x[(i*2)])
    second.push(x[(i*2)-1])
  end

  puts first.inspect
  puts second.inspect

  c.icm(first,alphabet,sum)
  c.icm(second,alphabet,sum)

  thirds = n/3
  first = []
  second = []
  third = []

  first.push(x[0])
  for i in 1..thirds

      first.push(x[(i*3)])
      second.push(x[(i*3)-2])
      third.push(x[(i*3)-1])
  end
  puts " "
  puts first.inspect
  puts second.inspect
  puts third.inspect


  c.icm(first,alphabet,sum)
  c.icm(second,alphabet,sum)
  c.icm(third,alphabet,sum)
end
