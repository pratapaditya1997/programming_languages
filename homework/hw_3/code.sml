(*1*)
(*take string list and return list of strings that has only strings with first uppercase characters*)
val only_capitals = List.filter (fn x => Char.isUpper(String.sub(x,0)))

(*2*)
(*takes string list and return longest string*)
val longest_string1 = foldl (fn (x,acc) => if String.size x > String.size acc then x else acc) ""

(*3*)
val longest_string2 = foldl (fn (x,acc) => if String.size x >= String.size acc then x else acc) ""

(*4*)
fun longest_string_helper f xs =
  foldl (fn(x,acc) => if f(String.size x, String.size acc) then x else acc) "" xs

(*using above helper function in partial application*)
val longest_string3 = longest_string_helper (fn(x,y) => x > y);
val longest_string4 = longest_string_helper (fn(x,y) => x >= y);

(*5*)
(*return longest string with first character capitalized*)
val longest_capitalized = (longest_string3 o only_capitals)

(*6*)
(*reverse a string function*)
val rev_string = String.implode o List.rev o String.explode

exception NoAnswer

(*7*)
fun first_answer f xs =
  case xs of
    [] => raise NoAnswer
    | x::xs' => case f x of
                  SOME v => v
                  | NONE => first_answer f xs'

(*8*)
fun all_answers f xs =
  let
    fun aux xs acc =
      case xs of
        [] => SOME acc
        | x::xs' => case f x of
                      NONE => NONE
                      | SOME y => aux xs' (acc @ y)
  in
    aux xs []
  end

(*some helper functions*)
datatype pattern = 
  Wildcard
  | Variable of string
  | UnitP
  | ConstP of int
  | TupleP of pattern list
  | ConstructorP of string * pattern

datatype valu = 
  Const of int 
  | Unit
  | Tuple of valu list
  | Constructor of string * valu

(* val it = fn : (unit -> int) -> (string -> int) -> pattern -> int  *)
fun g f1 f2 p =
  let
    val r = g f1 f2
  in
    case p of
      Wildcard => f1 ()
      | Variable x => f2 x
      | TupleP ps => List.foldl (fn(p,i) => (r p) + i) 0 ps
      | ConstructorP(_,p) => r p
      | _ => 0
  end

(*continue with assignment questions*)
(*9*)
(*a*)
fun count_wildcards p =
  g (fn () => 1) (fn str => 0) p

(*b*)
fun count_wild_and_variable_lengths p =
  g (fn () => 1) (String.size) p

(*c*)
fun count_some_var (s,p) =
  g (fn () => 0) (fn str => if s = str then 1 else 0) p

(*10*)
fun check_pat p =
  let
    fun aux ptn =
      case ptn of
        Variable s => [s]
        | TupleP ps => List.foldl (fn(p,i) => (aux p) @ i) [] ps
        | ConstructorP(_,p) => aux p
        | _ => []

    fun has_repeat xs = 
      case xs of
        [] => false
        | x::xs' => if List.exists (fn y => y = x) xs'
                    then true
                    else has_repeat xs'
  in
    (not o has_repeat o aux) p
  end

(*11*)
fun match (v,p) =
  case (v,p) of
    (_,Wildcard) => SOME []
    | (sv, Variable sp) => SOME [(sp,sv)]
    | (Unit, UnitP) => SOME []
    | (Const iv, ConstP ip) => if iv = ip then SOME [] else NONE
    | (Tuple tv, TupleP tp) => if List.length tv = List.length tp
                               then all_answers match (ListPair.zip(tv,tp))
                               else NONE
    | (Constructor (s1,cv), ConstructorP (s2,cp)) => if s1 = s2
                                                      then match (cv,cp)
                                                      else NONE
    | (_,_) => NONE


(*12*)
fun first_match v p =
  SOME (first_answer (fn x => match(v,x)) p) handle NoAnswer = NONE

