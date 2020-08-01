use "code.sml";

val test1 = is_older ((1,2,3), (2,3,4)) = true

val test2 = number_in_month ([(2012,2,28),(2013,12,1)],2) = 1
val test3 = number_in_month ([(2012,2,28)], 3) = 0

val test4 = number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = 3

val test5 = dates_in_month ([(2012,2,28),(2013,12,1)],2) = [(2012,2,28)]
val test6 = dates_in_month ([(2012,2,28)], 3) = []

val test7 = dates_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = [(2012,2,28),(2011,3,31),(2011,4,28)]

val test8 = get_nth (["hi", "there", "how", "are", "you"], 2) = "there"

val test9 = date_to_string (2013, 6, 1) = "June 1, 2013"

val test10 = number_before_reaching_sum (10, [1,2,3,4,5]) = 3

val test11 = what_month 70 = 3

val test12 = month_range (31, 34) = [1,2,2,2]

val test13 = oldest([(2012,2,28),(2011,3,31),(2011,4,28)]) = SOME (2011,3,31)

val test14 = remove_duplicates([2,4,2,1,2,5,7,3,5,7,9,7,8,6,4,7,2,4,2,5,0]) = [1,3,9,8,6,7,4,2,5,0]

val test15 = number_in_months_challenge([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4,2,3]) = 3

val test16 = dates_in_months_challenge([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4,2,3]) = [(2011,4,28),(2012,2,28),(2011,3,31)]