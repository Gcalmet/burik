#import "draw.typ": *
#import "cubes.typ": *

#set text(size: 16pt)
#set document(date: none)

= PLL examples
#pll("M2 U' M2 U2 M2 U' M2")
#pll("M2 U' M2 U' M' U2 M2 U2 M' U2")
#pll("R' U R' U' R3 U' R' U R U R2")
#pll("R U R' U R' U' R2 U' R' U R' U R U2")
#pll("l' R' D2 R U R' D2 R U' l")
#pll(invert("l' R' D2 R U R' D2 R U' l"))
#pll("R U R' U' R' F R2 U' R' U' R U R' F'")
#pll("F R U' R' U' R U R' F' R U R' U' R' F R F'")

#pagebreak()

#let sune = "R U R' U R U2 R'"
#let anti-sune = invert(sune)
#let double-sune = conc(sune, sune)
#let triple-sune = conc(sune, conc(sune, sune))

#let sexy = "U R U' R'"
#let anti-sexy = invert(sexy)

#let Fsexy = enclose(sexy, "F")
#let anti-Fsexy = invert(Fsexy)
#let double-Fsexy = conc(Fsexy, Fsexy)
#let anti-double-Fsexy = invert(double-Fsexy)

#let triple-Fsexy = conc(Fsexy, conc(Fsexy, Fsexy))

#let sledgehammer = "F R' F' R"
#let anti-sledgehammer = invert(sledgehammer)

#let fat-sune = "r U R' U R U2 r'"

#let H = "R U R' U' M' U R U' r'"
#let big-fish = "r U R' U' M U R U' R'"

= OLL examples
#oll(sune)
#oll(anti-sune)
#oll(double-sune)
#oll(triple-sune)
#oll(Fsexy)
#oll(anti-Fsexy)
#oll(double-Fsexy)
#oll(anti-double-Fsexy)
#oll(conc(anti-sexy, anti-sledgehammer))
#oll(conc(sledgehammer, sexy))
#oll(H)
#oll(big-fish)

#pagebreak()

= F2L examples
#f2l("R U R'")
#f2l("U R U' R'")
#f2l("F R' F' R")
#f2l("U' R U2 R' U R U R' ")
#f2l("R2 u R U R' U' u' R' U R'")
#f2l("f R f'")
#f2l("f R' f'")
#f2l("r' U' R U M'")
#f2l("F r U r' U' r U r' U' r U r' U' F'")

#pagebreak()

= COLL examples
#coll("R2 D' R U2 R' D R U2 R")
#coll("R2 D' R U R' D R U R U' R' U' R")
#coll("R' U' R U' R' U2 R2 U R' U R U2 R'")
#coll("U2 R2 D R' U2 R D' R' U2 R'")
#coll("R' F R U' R' U' R U R' F' R U R' U' R' F R F' R")
#coll("F R U' R' U R U R' U R U' R' F'")
#coll("R' U2 R' D' R U2 R' D R2")
#coll("F R' F' r U R U' r'")
#coll("R U R' U R U' R' U R U' R' U R U2 R'")
#coll("R U2 R D R' U2 R D' R2")
#coll("F' L F l' U' L' U l")
#coll("r U2 R2 F R F' R U2 r'")

#pagebreak()

= OLS examples
#ols("U R U' R'")
#ols("R' F R F'")
#ols("U F' U2 F R U' R'")
#ols("M U R U' R' U' M'")
#ols("R' F R2 U R' U' F'") 