class DecryptFile
  f = File.open('lab1Crypted.txt')
  x = f.gets.upcase.split(//)
  n = x.length
  key = "can".upcase.split(//)
  k = key.length
  decryptedarray = []
  (0..n-1).each { |i|
    a = (x[i%n].ord-65)
    b =(key[i%k].ord-65)
    konwertnum = (a-b)%26
    characterdecrypted = (konwertnum+65).chr
    decryptedarray.push(characterdecrypted)
  }
  f2 = File.new("lab1DeCrypted.txt", "w")
  f2.puts decryptedarray.join.downcase
  f2.close
end