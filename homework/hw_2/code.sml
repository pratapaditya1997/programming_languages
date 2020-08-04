(*some global helper functions*)
fun same_string (s1: string, s2: string) =
    s1 = s2

(*1-a*)
(*takes a string and string list as input and returns list without input string*)
fun all_except_option (str, xs) =
    let
        fun helper (str, xs) =
            case xs of
                [] => []
                | x::xs' => if (same_string(x, str)) then xs'
                            else x::helper(str,xs')
        val ys = helper(str,xs)
    in
        if ys = xs then NONE
        else SOME ys
    end

(*1-b*)
(*takes list of list of strings as input which contains possible substitutions of a string and another input string*)
(*return list of similar words from subs list where input string is in the list*)
fun get_substitutions1 (xs, str) =
    case xs of
        [] => []
        | x::xs' => case all_except_option(str, x) of
                        NONE => get_substitutions1(xs', str)
                        | SOME ys => ys @ get_substitutions1(xs', str)

(*1-c*)
(*same as above but tail recursive implementation*)
fun get_substitutions2 (xs, str) =
    let
        fun helper (xs, acc) =
            case xs of
                [] => acc
                | x::xs' => case all_except_option(str, x) of
                                NONE => helper(xs', acc)
                                | SOME ys => helper(xs', acc @ ys)
    in
        helper(xs, [])
    end

(*1-d*)
(*given string list list of substitutions and given full name in record form, convert it to multiplte similar full names based on the subs list*)
fun similar_names (subs, name) =
    let
        val {first=fst, middle=mid, last=lst} = name
        val sim_names = get_substitutions2(subs, fst)
        fun helper (xs) =
            case xs of
                [] => []
                | x::xs' => {first=x, middle=mid, last=lst}::helper(xs')
    in
        name::helper(sim_names)
    end