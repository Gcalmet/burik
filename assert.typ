#import "algo.typ":*

#let two_top_layers = (face) => {
    let c = face.at(4)  // color of the center
    face.at(0) == c and face.at(1) == c and face.at(2) == c and face.at(3) == c and face.at(4) == c and face.at(5) == c
}

#let cross = (face) => {
    let c = face[4]  // color of the center
    face[1] == c and face[3] == c and face[5] == c and face[7] == c
}

#let assert_pll(cube) = {

  // Check white face
  let u_check = cube.u.all((x) => x == colors.white)

  // Check 2 top layers on the 4 sides
  let f_check = two_top_layers(cube.f)
  let b_check = two_top_layers(cube.b)
  let r_check = two_top_layers(cube.r)
  let l_check = two_top_layers(cube.l)

  // Check yellow face
  let d_check = cube.d.all((x) => x == colors.yellow)

  // Returns True only if cube is in pll config
  u_check and f_check and b_check and r_check and l_check and d_check
}

#let assert_oll(cube) = {

  // Check white face
  let u_check = cube.u.all((x) => x == colors.white)

  // Check 2 top layers on the 4 sides
  let f_check = two_top_layers(cube.f)
  let b_check = two_top_layers(cube.b)
  let r_check = two_top_layers(cube.r)
  let l_check = two_top_layers(cube.l)

  // Returns True only if cube is in oll config
  u_check and f_check and b_check and r_check and l_check
}

/*let assert_f2l(cube) = {

  // Check white face
  let u_check = cube.u.all((x) => x == colors.white)

  // Check 2 top layers on the 4 sides
  let f_check = two_top_layers(cube.f)
  let b_check = two_top_layers(cube.b)
  let r_check = two_top_layers(cube.r)
  let l_check = two_top_layers(cube.l)

  // Returns True only if cube is in oll config
  u_check and f_check and b_check and r_check and l_check
}*/

// TODO : assert_f2l, 3 pairs solved over 4
