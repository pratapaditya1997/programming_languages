use "code2.sml";

val test1 = card_color (Clubs, Num 2) = Black

val test2 = card_value (Clubs, Num 2) = 2
val test3 = card_value (Clubs, Ace) = 11
val test4 = card_value (Clubs, Jack) = 10

val test5 = remove_card ([(Hearts, Ace)], (Hearts, Ace), IllegalMove) = []

val test6 = all_same_color [(Hearts, Ace), (Hearts, Ace)] = true
val test7 = all_same_color [(Hearts, Ace), (Clubs, Ace)] = false

val test8 = sum_cards [(Clubs, Num 2),(Clubs, Num 2)] = 4

val test9 = score ([(Hearts, Num 2),(Clubs, Num 4)],10) = 4
val test10 = score ([(Hearts, Ace),(Clubs, Num 4)],10) = 15
val test11 = score ([(Hearts, Num 2),(Hearts, Num 4)],10) = 2

val test12 = officiate ([(Hearts, Num 2),(Clubs, Num 4)],[Draw], 15) = 6
val test13 = officiate ([(Clubs,Ace),(Spades,Ace),(Clubs,Ace),(Spades,Ace)],
                        [Draw,Draw,Draw,Draw,Draw],
                        42)
             = 3
val test14 = ((officiate([(Clubs,Jack),(Spades,Num(8))],
                         [Draw,Discard(Hearts,Jack)],
                         42);
               false)
              handle IllegalMove => true)