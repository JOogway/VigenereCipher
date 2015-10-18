class CryptFile
  f2 = File.open('lab1.txt')

    x = f2.gets.upcase.split(//)
    n = x.length
    key = "can".upcase.split(//)
    k = key.length
    cryptedarray = []

    (0..n-1).each { |i|
      a = (x[i%n].ord-65)
      b =(key[i%k].ord-65)
      konwertnum = (a+b)%26
      charactercrypted = (konwertnum+65).chr
      cryptedarray.push(charactercrypted)
    }
    f2 = File.new("lab1Crypted.txt", "w")
    f2.puts cryptedarray.join.downcase
    f2.close
end