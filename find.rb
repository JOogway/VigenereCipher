class Find
  f = File.open('lab1Crypted.txt')
  x = f.gets.upcase.split(//)
  n = x.length
  key = []
  first = []
  second = []
  half = n/2
  *alphabet = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z']
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
    puts "Indeks zgodnosci dla bloku: ", ic
    sum = 0
  end

  def mic block1,block2,alfa,g,key
    znacznik = 0
    sum=0
    for i in 0..25
    fi = block1.count(alfa[i])
    fip = block2.count(alfa[i-g])
    sigma = fi*fip
    sum = sum + sigma
    end
    znacznik = znacznik+1
    n1 = block1.length
    n2 = block2.length
    deno = n1 * n2
    mic = (sum.to_f/deno.to_f).round(4)
    puts mic.round(3)
    if mic <0.0665 && mic > 0.0661
      key.push(alfa[znacznik+1])
      puts "^"
    end
  end
  c = Find.new

  for i in 0..half-1
    first.push(x[(i*2)])
    second.push(x[(i*2)+1])
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
  puts " "

  for i in 0..25
    c.mic(first,second,alphabet,i,key)
  end
  puts " "
  for i in 0..25
    c.mic(second,third,alphabet,i,key)
  end
  puts " "
  for i in 0..25
    c.mic(first,third,alphabet,i,key)
  end
  puts "Klucz: #{key}"
end
