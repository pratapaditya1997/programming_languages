(* 1 *)
(* to check if first date is older than the second one *)
fun is_older (date1: int*int*int, date2: int*int*int) =
    (#1 date1 < #1 date2)
    orelse (#1 date1 = #1 date2 andalso #2 date1 < #2 date2)
    orelse (#1 date1 = #1 date2 andalso #2 date1 = #2 date2 andalso #3 date1 < #3 date2)

(* 2 *)
(* takes list of dates and a month, return count of dates which are in this month *)
fun number_in_month (dates: (int*int*int) list, month: int) =
    if null dates then 0
    else 
        let val tl_ans = number_in_month (tl dates, month) in
            if(#2 (hd dates) = month) then 1 + tl_ans
            else tl_ans
        end

(* 3 *)
(* takes list of dates and list of months and returns count of dates which are in any of these months *)
fun number_in_months (dates: (int*int*int) list, months: int list) =
    if null months then 0
    else
        number_in_month (dates, hd months) + number_in_months (dates, tl months)

(* 4 *)
(* takes list of dates and a month and returns a list of dates that are in this month and order should be the same as in the input *)
fun dates_in_month (dates: (int*int*int) list, month: int) =
    if null dates then []
    else
        let val tl_ans = dates_in_month (tl dates, month) in
            if(#2 (hd dates) = month) then (hd dates)::tl_ans
            else tl_ans
        end

(* 5 *)
(* takes list of dates and list of months and returns list of dates which are in any of the months *)
fun dates_in_months (dates: (int*int*int) list, months: int list) =
    if null months then []
    else
        dates_in_month (dates, hd months) @ dates_in_months (dates, tl months)

(* 6 *)
(* get nth element of a list *)
fun get_nth (xs: string list, n: int) =
    if n = 1 then hd xs
    else get_nth (tl xs, n-1)

(* 7 *)
(* convert date to string form *)
fun date_to_string (date: int*int*int) =
    let 
        val months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
        val comma = ","
        val space = " " in
        get_nth (months, #2 date) ^ space ^ Int.toString (#3 date) ^ comma ^ space ^ Int.toString (#1 date)
    end

(* 8 *)
(* return first index at which prefix sum reaches sum variable *)
fun number_before_reaching_sum (sum: int, xs: int list) =
    let
        fun helper (cur_sum: int, idx: int, cur_xs: int list) =
            if(cur_sum + hd cur_xs >= sum) then idx
            else helper(cur_sum + hd cur_xs, idx+1, tl cur_xs)
    in
        helper(0,0,xs)
    end

(* 9 *)
(* return month by day of year in integer form *)
fun what_month (day: int) =
    let
        val day_count = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    in
        1 + number_before_reaching_sum (day, day_count)
    end

(* 10 *)
(* find month ids for dates in range [date1, date2] *)
fun month_range (day1: int, day2: int) =
    if day1 > day2 then []
    else
        what_month (day1)::month_range(day1+1, day2)

(* 11 *)
(* return oldest date option given a list of dates *)
fun oldest (dates: (int*int*int) list) =
    if null dates then NONE
    else
        let
            fun helper (dates: (int*int*int) list) =
                if null (tl dates) then hd dates
                else
                    let
                        val tl_ans = helper(tl dates)
                    in
                        if is_older(hd dates, tl_ans) then hd dates
                        else tl_ans
                    end

        in
            SOME (helper dates)
        end

(* challenge problems *)
(* 12 *)
(* remove duplicates from a list and then call the Q3 and Q5 methods*)
fun remove_duplicates (xs: int list) =
    let
        fun check (xs: int list, item: int) =
            if null xs then false
            else if hd xs = item then true
            else check(tl xs, item)

        fun helper (xs: int list) =
            if null xs then []
            else if check(tl xs, hd xs) then helper(tl xs)
            else (hd xs)::helper(tl xs)
    in
        helper(xs)
    end

fun number_in_months_challenge (dates: (int*int*int) list, months: int list) =
    number_in_months (dates, remove_duplicates months)

fun dates_in_months_challenge (dates: (int*int*int) list, months: int list) =
    dates_in_months (dates, remove_duplicates months)





