pioneers = [
  "Nqn Ybirynpr",
  "Tenpr Ubccre",
  "Nqryr Tbyqfgvar",
  "Nyna Ghevat",
  "Puneyrf Onoontr",
  "Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv",
  "Wbua Ngnanfbss",
  "Ybvf Unvog",
  "Pynhqr Funaaba",
  "Fgrir Wbof",
  "Ovyy Tngrf",
  "Gvz Orearef-Yrr",
  "Fgrir Jbmavnx",
  "Xbaenq Mhfr",
  "Fve Nagbal Ubner",
  "Zneiva Zvafxl",
  "Lhxvuveb Zngfhzbgb",
  "Unllvz Fybavzfxv",
  "Tregehqr Oynapu"
]

def decode_rot13_word(str)
  alphabet = [*'a'..'z']
  alphabet_rot13 = alphabet.rotate(-13)
  str.tr(alphabet.join, alphabet_rot13.join)
end

def decode_rot13_fullname(full_name)
  full_name
    .downcase
    .split
    .map { |name| decode_rot13_word(name) }
    .map(&:capitalize)
    .join(' ')
end

puts pioneers.map { |name| decode_rot13_fullname(name) }

def decode(str)
  str.tr('a-zA-z', 'n-za-mN-ZA-M')
end

pioneers.map { |name| decode(name) }