(* checkRow s x y
   TYPE: sudokuGrid * int * int
   PRE:  
   POST: returnerar en vektor där positionerna el-1 är false om elementen el finns i raden y.
   EXAMPLES: checkRow(SG(fromList[fromList[(SOME 1, []), (NONE, []), (NONE, []), (NONE, []), (SOME 7, []), (NONE, []), (NONE, []), (NONE, []), (NONE, [])], ...]), 3, 0) =
             fromList[false, true, true, true, true, true, false, true, true]
)
*)
(* Egentligen behövs inte x men det är där för att man enklare skall kunna greppa vad funktionen gör. *)
fun checkRow(SG(v), x, y) =
    let
  fun checkRow'(rowVec, boolVec, 9) =
	    boolVec
	  | checkRow'(rowVec, boolVec, pos) =
	    case Vector.sub(rowVec, pos) of
	      (NONE, _)       => checkRow'(rowVec, boolVec, pos+1)
	    | (SOME value, _) => checkRow'(rowVec, Vector.update(boolVec, value-1, false), pos+1)
    in
 	checkRow'(Vector.sub(v, y), Vector.tabulate(9, fn _ => true), 0)
    end;
