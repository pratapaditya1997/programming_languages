datatype exp = 
    Constant of int 
    | Negate of exp
    | Add of exp * exp
    | Multiply of exp * exp

fun eval e =
    case e of
        Constant i => i
        | Negate e2 => ~ (eval e2)
        | Add(e1, e2) => (eval e1) + (eval e2)
        | Multiply(e1,e2) => (eval e1) * (eval e2)


fun evaluate (Constant i) = i
    | evaluate (Negate e2) = ~ (evaluate e2)
    | evaluate (Add(e1,e2)) = (evaluate e1) + (evaluate e2)
    | evaluate (Multiply(e1,e2)) = (evaluate e1) * (evaluate e2)

fun sum_list xs =
    case xs of
        [] => 0
        | x::xs' => x + sum_list xs'

(* it takes triple as argument and uses pattern matching to bind three variables to the three pieces for use in the function body *)
fun sum_triple (x,y,z) =
    x + y + z

(* tail recursion *)
fun sum xs =
    let
        fun helper (xs, acc) =
            case xs of
                [] => acc
                | i::xs' => helper(xs', i+acc)
    in
        helper(xs,0)
    end

(* tail recursive factorial function *)
fun fact n =
    let
        fun helper (n, acc) =
            if n = 0 then acc
            else helper(n-1, n * acc)
    in
        helper(n,1)
    end