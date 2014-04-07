
process a 1
process c 1
process f 1

(* actions on c *)
f 1 -> c 0 1 (* prio 3 *)
c 1 -> c 1 0 (* prio 3 *)

(* actions on a *)
COOPERATIVITY([f;c] -> a 0 1, [[1;0]]) (* prio 2 *)
c 1 -> a 1 0 (* prio 2 *)

(*
(* actions on f *)
f 1 -> f 1 0
f 0 -> c 1 0
*)

initial_state f 1, c 0, a 0

