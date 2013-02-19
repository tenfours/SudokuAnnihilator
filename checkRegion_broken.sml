datatype sudokuGrid = SG of (int option * int list) vector vector;

val test = SG(tabulate(9, fn _ => (tabulate(9, fn _ => (NONE, [])))));

(* count ska vara storleken av v vid första anrop! *)
fun boolToList(v, ~1) = 
    []
  | boolToList(v, count) =
    if(Vector.sub(v, count) = false) then
  count :: boolToList(v, count-1)
    else
	boolToList(v, count-1)

fun checkRegion'(r1, r2, r3, 0, counter, ack) =
    if(counter > 3) then
	checkRegion'(r1, r2, r3, 1, 0, ack)
    else
	checkRegion'(r1, r2, r3, 0, counter+1, Vector.update(ack, valOf(Vector.sub(r1, counter)), true)) 
  | checkRegion'(r1, r2, r3, 1, counter, ack) =
    if(counter > 3) then
	checkRegion'(r1, r2, r3, 2, 0, ack)
    else
	checkRegion'(r1, r2, r3, 1, counter+1, Vector.update(ack, valOf(Vector.sub(r2, counter)), true)) 
  | checkRegion'(r1, r2, r3, 2, counter, ack) =
    if(counter > 3) then
	ack
    else
	checkRegion'(r1, r2, r3, 0, counter+1, Vector.update(ack, valOf(Vector.sub(r3, counter)), true))

(* Ska ta in tre rader (vektorer) och ett tal, där 1 är region längst till vänster, 2 den i mitten och 3 den längst till höger. *)
fun checkRegion(r1, r2, r3, quadrant) =
    if(quadrant = 1) then
	let val v = checkRegion'(Vector.fromList([Vector.sub(r1, 0), 
					      Vector.sub(r1, 1), 
					      Vector.sub(r1, 2)]),
			      Vector.fromList([Vector.sub(r2, 0),
					      Vector.sub(r2, 1)
					      Vector.sub(r2, 2)]),
			      Vector.fromList([Vector.sub(r3, 0),
					      Vector.sub(r3, 1),
					      Vector.sub(r3, 2)]),
		     0, 0, Vector.tabulate(9, fn _ => false))
	in
	    boolToList(v, Vector.length(v))
	end

    else if (quadrant = 2) then
	let val v = checkRegion'(Vector.fromList(Vector.sub(r1, 3), 
					      Vector.sub(r1, 4), 
					      Vector.sub(r1, 5)),
			      Vector.fromList(Vector.sub(r2, 3),
					      Vector.sub(r2, 4)
					      Vector.sub(r2, 5)),
			      Vector.fromList(Vector.sub(r3, 3),
					      Vector.sub(r3, 4),
					      Vector.sub(r3, 5)),
		     0, 0, Vector.tabulate(9, fn _ => false))
	in
	    boolToList(v, Vector.length(v))
	end

    else
        let val v = checkRegion'(Vector.fromList(Vector.sub(r1, 6), 
					      Vector.sub(r1, 7), 
					      Vector.sub(r1, 8)),
			      Vector.fromList(Vector.sub(r2, 6),
					      Vector.sub(r2, 7)
					      Vector.sub(r2, 8)),
			      Vector.fromList(Vector.sub(r3, 6),
					      Vector.sub(r3, 7),
					      Vector.sub(r3, 8)),
		     0, 0, Vector.tabulate(9, fn _ => false))
	in
	    boolToList(v, Vector.length(v))
	end
