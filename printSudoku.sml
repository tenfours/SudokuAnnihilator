fun printSudoku(s) = 
    let
  fun printSudoku'(x, y) =
	    if(y < 9) then
		if(x<9) then
		    case sub(s, x, y) of
		      (NONE, _)       => (print("[ ]"); printSudoku'(x+1, y))
                    | (SOME value, _) => (print("[" ^ Int.toString(value) ^ "]"); printSudoku'(x+1, y))
		else
		    (print("\n"); printSudoku'(0, y+1))
	    else
		()
    in
	printSudoku'(0, 0)
    end;
