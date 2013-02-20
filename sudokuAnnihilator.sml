datatype sudokuGrid = SG of (int option * int list) vector vector;

fun emptyGrid() = SG(Vector.tabulate(9, (fn _ => Vector.tabulate(9, fn _ => (NONE, [])))));

(* Returnerar (int option * int list) på koordinaten (x,y) *)
fun sub(SG(v), x, y) = Vector.sub(Vector.sub(v, y), x);

fun update(SG(v), x, y, new) = SG(Vector.update(v, y, Vector.update(Vector.sub(v, y), x, (new, []))));
