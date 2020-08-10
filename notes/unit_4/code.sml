signature MATHLIB = 
sig
    val fact: int -> int
    val half_pi: real
    val doubler: int -> int
end

structure MyMathLib :> MATHLIB = 
struct
    fun fact x = 
        if x = 0
        then 1
        else x * fact (x-1)

    val half_pi = Math.pi / 2.0

    fun doubler y = y + y
end

fun match xs =
    let
        fun s_need_one xs =
            case xs of
                [] => true
                | 1::xs' => s_need_two xs'
                | _ => false
        and s_need_two xs =
            case xs of
                [] => false
                | 2::xs' => s_need_one xs'
                | _ => false
    in
        s_need_one xs
    end