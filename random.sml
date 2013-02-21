(* seed
   VALUE: The PRNG seed.
*)
val seed = ref 1

(* srand seed
   TYPE:  int -> unit
   PRE: seed > 0
   POST: (none)
   SIDE-EFFECTS: Sets the seed of the PRNG to seed.
*)
fun srand(next) =
    seed := next

(* rand
   TYPE: unit -> int
   PRE:  (none)
   POST: The next number in the PRNG sequence defined by its seed.
   SIDE-EFFECT: Updates the seed of the PRNG.
*)
fun rand() =
    (seed := !seed * 1103515245 + 12345;
     (!seed div 65536) mod 32768)
