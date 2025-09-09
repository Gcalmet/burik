#import "cubes.typ" : *
#import "moves.typ" : *

#let move_value = move => {
  if move.ends-with("'") {
    (move.slice(0, -1), -1)
  } else if move.ends-with("2") {
    (move.slice(0, -1), 2)
  } else {
    (move, 1)
  }
}

#let value_to_move = (face, value) => {
  let v = calc.rem(value,4)
  if v == 0 {
    none
  } else if v == 1 {
    face
  } else if v == 2 {
    face + "2"
  } else {
    face + "'"
  }
}

#let simplify = algo => {
  let moves = algo.split(" ")
  let changed = true

  while changed {
    let i = 0
    let new_moves = ()
    changed = false

    while i < moves.len() {
      if i < moves.len() - 1 {
        let a = moves.at(i)
        let b = moves.at(i + 1)
        let (face_a, val_a) = move_value(a)
        let (face_b, val_b) = move_value(b)

        if face_a == face_b {
          let merged = value_to_move(face_a, val_a + val_b)
          if merged != none {
            new_moves.push(merged)
          }
          i += 2
          changed = true
          continue
        }
      }
      new_moves.push(moves.at(i))
      i += 1
    }

    moves = new_moves
  }
  moves.join(" ")
}

#let apply_sequence = (cube, sequence) => sequence.fold(cube, apply_move)

#let invert_move = move => {
  if move.ends-with("'") {
    move.slice(0,-1)
  } else if move.ends-with("2") {
    move
  } else if move.ends-with("3") {
     move.slice(0,-1)
  } else {
    move + "'"
  }
}

#let invert_algo = algo_array => {
  algo_array.rev().map(invert_move)
}

#let invert = str => str.split(" ").rev().map(invert_move).join(" ")

#let conc = (algo1, algo2) => {
  simplify(algo1 + " " + algo2)
}

#let enclose = (algo, prefix)  => {
  conc(prefix, conc(algo, invert(prefix)))
}

#let find_permutation(cube)={
  let permut = ()

  let edges = ("U" : cube.u.at(7), "L" : cube.l.at(5), "R" : cube.r.at(3), "D" : cube.d.at(1))

  let corners = ("LU" :  cube.l.at(2), "RU" : cube.u.at(8), "RD" : cube.r.at(6) , "LD" : cube.d.at(0))

  let centers = ("U" : cube.u.at(4), "L" : cube.l.at(4), "R" : cube.r.at(4), "D" : cube.d.at(4), "LU" : cube.l.at(4), "RU" : cube.u.at(4), "RD" : cube.r.at(4), "LD":cube.d.at(4))

  for (edge1, color1) in edges.pairs() {
    for (edge2, color2) in edges.pairs() {
      if color1 == centers.at(edge2) and edge1 != edge2{
        permut.push((edge1, edge2))
      }
    }
  }

  for (corner1, color1) in corners.pairs() {
    for (corner2, color2) in corners.pairs() {
      if color1 == centers.at(corner2) and corner1 != corner2{
        permut.push((corner1, corner2))
      }
    }
  }

  permut
}
