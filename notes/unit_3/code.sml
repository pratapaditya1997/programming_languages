fun n_times (f,n,x) =
  if n=0 then x
  else f (n_times(f,n-1,x))

fun double x = x + x
val x1 = n_times(double,4,7)

fun increment x = x + 1
val x2 = n_times(increment,4,7)

val x3 = n_times(tl,2,[4,8,12,16])

fun triple_n_times (n,x) = n_times((fn y => 
  3*y), n, x)

fun map (f, xs) =
  case xs of
    [] => []
    | x::xs' => (f x)::(map(f, xs'))

val x4 = map (increment, [4,8,12,16])
val x5 = map (hd, [[1,2], [3,4], [5,6,7]])

fun filter (f,xs) =
  case xs of
    [] => []
    | x::xs' => if f x 
                then x::(filter(f,xs'))
                else filter(f,xs')

fun allGreaterThan (xs,n) = filter (fn x => x > n, xs)

fun fold (f,acc,xs) =
  case xs of
    [] => acc
    | x::xs' => fold(f, f(acc,x), xs')

val sorted = fn x => fn y => fn z => (z >= y andalso y >= x)

(*curried form*)
fun fold_partial f acc xs =
  case xs of
    [] => acc
    | x::xs' => fold_partial f (f(acc,x)) xs'

val sum2 = fold_partial (fn(x,y) => x+y) 0



(*callback part*)
val cbs: (int -> unit) list ref = ref []

fun onKeyEvent f = cbs := f::(!cbs)

fun onEvent i = 
  let
    fun loop fs =
      case fs of
        [] => ()
        | f::fs' => (f i; loop fs')
  in
    loop (!cbs)
  end

val timesPressed = ref 0
val _ = onKeyEvent (fn _ => timesPressed := (!timesPressed) + 1)

fun printIfPressed i =
  onKeyEvent (fn j => if i = j
                      then print ("you pressed " ^ Int.toString i ^ "\n")
                      else ())

val _ = printIfPressed 4
val _ = printIfPressed 11
val _ = printIfPressed 23