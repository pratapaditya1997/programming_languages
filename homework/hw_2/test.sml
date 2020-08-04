use "code.sml";

val test1 = all_except_option ("string", ["string"]) = SOME []
val test2 = all_except_option ("string", []) = NONE
val test3 = all_except_option ("string", ["string", "not_string"]) = SOME ["not_string"]

val test4 = get_substitutions1 ([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]],
"Fred") = ["Fredrick","Freddie","F"]
val test5 = get_substitutions1([["Fred","Fredrick"],["Jeff","Jeffrey"],["Geoff","Jeff","Jeffrey"]],
"Jeff") = ["Jeffrey","Geoff","Jeffrey"]

val test6 = get_substitutions1 ([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]],
"Fred") = ["Fredrick","Freddie","F"]
val test7 = get_substitutions1([["Fred","Fredrick"],["Jeff","Jeffrey"],["Geoff","Jeff","Jeffrey"]],
"Jeff") = ["Jeffrey","Geoff","Jeffrey"]

val test8 = similar_names ([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]],
                            {first="Fred", middle="W", last="Smith"}) =
            [{first="Fred", last="Smith", middle="W"}, 
             {first="Fredrick", last="Smith", middle="W"},
             {first="Freddie", last="Smith", middle="W"}, 
             {first="F", last="Smith", middle="W"}]