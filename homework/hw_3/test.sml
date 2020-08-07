use "code.sml";

val test1 = only_capitals ["Aps","aditya","HH"] = ["Aps","HH"];
val test2 = only_capitals ["aps", "hi"] = [];

val test3 = longest_string1 ["aps", "aditya", ""] = "aditya";
val test4 = longest_string1 [] = "";
val test5 = longest_string1 ["aps", "yes"] = "aps";

val test6 = longest_string2 ["aps", "aditya", ""] = "aditya";
val test7 = longest_string2 [] = "";
val test8 = longest_string2 ["aps", "yes"] = "yes";

val test9 = longest_string3 ["aps", "aditya", ""] = "aditya";
val test10 = longest_string3 [] = "";
val test11 = longest_string3 ["aps", "yes"] = "aps";

val test12 = longest_string4 ["aps", "aditya", ""] = "aditya";
val test13 = longest_string4 [] = "";
val test14 = longest_string4 ["aps", "yes"] = "yes";

val test15 = longest_capitalized ["Aps", "App", "Aditya"] = "Aditya";

val test16 = rev_string "aps" = "spa";

val test17 = first_answer (fn x => if x > 3 then SOME x else NONE) [1,2,3,4,5] = 4;

val test18 = all_answers (fn x => if x = 1 then SOME [x] else NONE) [2,3,4,5,6,7] = NONE;

val test19 = count_wildcards Wildcard = 1;

val test20 = count_wild_and_variable_lengths (Variable("a")) = 1;

val test21 = count_some_var ("x", Variable("x")) = 1;

val test22 = check_pat (Variable("x")) = true;