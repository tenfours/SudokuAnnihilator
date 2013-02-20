datatype sudokuGrid = SG of (int option * int list) vector vector;

fun emptyGrid() = SG(Vector.tabulate(9, (fn _ => Vector.tabulate(9, fn _ => (NONE, [])))));

(* Returnerar (int option * int list) på koordinaten (x,y) *)
fun sub(SG(v), x, y) = Vector.sub(Vector.sub(v, y), x);

(* update s x y new
   TYPE: sudokuGrid * int * int * int -> sudokuGrid
   PRE:  0<x<9 och 0<y<9
   POST: en ny sudokuGrid identisk till s där (SOME new, []) är inlagt på position (x, y)
   EXAMPLES: 
*)
fun update(SG(v), x, y, new) = SG(Vector.update(v, y, Vector.update(Vector.sub(v, y), x, (SOME new, []))));

fun delete(SG(v), x, y) = SG(Vector.update(v, y, Vector.update(Vector.sub(v, y), x, (NONE, []))));

