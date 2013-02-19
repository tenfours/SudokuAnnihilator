datatype sudokuGrid = SG of (int option * int list) vector vector;

fun emptyGrid() = SG(Vector.tabulate(9, (fn _ => Vector.tabulate(9, fn _ => (NONE, [])))));

fun sub(SG(v), x, y) = Vector.sub(Vector.sub(v, y), x);

fun update(SG(v), x, y, new) = Vector.update(Vector.sub(v, y), x, new);
