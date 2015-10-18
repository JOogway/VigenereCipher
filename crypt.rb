class Crypt
  x = "bardzosiecieszewreszciezezaczalsierokakademicki".upcase.split(//)
  j = x.length
  key = "klamstwo".upcase.split(//)
  k = key.length
  cryptedarray = []

    (0..j-1).each { |i|
      a = (x[i%47].ord-65)
      b =(key[i%8].ord-65)
      konwertnum = (a+b)%26
      charactercrypted = (konwertnum+65).chr
      cryptedarray.push(charactercrypted)
    }

    puts cryptedarray

end