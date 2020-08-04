(*some helper bindings*)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw

exception IllegalMove

(*assignment solutions start below*)
fun same_card (c1: card, c2: card) =
  c1 = c2

(*2-a*)
fun card_color (c) =
  case c of
    (Clubs,_) => Black
    | (Diamonds,_) => Red
    | (Hearts,_) => Red
    | (Spades,_) => Black

(*2-b*)
fun card_value (c) =
  case c of
    (_,Num x) => x
    | (_,Ace) => 11
    | (_,_) => 10

(*2-c*)
(*remove card c from list of cards cs, raise error if not present*)
fun remove_card (cs, c, e) =
  let
    fun helper (cs) =
      case cs of
        [] => []
        | cur::cs' => if same_card (cur,c) then helper(cs')
                      else cur::helper(cs')
    val res_list = helper(cs)
  in
    if res_list = cs then raise e
    else res_list
  end

(*2-d*)
(*check if all cards are of same color in the list*)
fun all_same_color (cs) =
  case cs of
    [] => true
    | c::[] => true
    | c::(neck::cs') => card_color(c) = card_color(neck) andalso all_same_color(neck::cs')

(*2-e*)
(*sum cards in tail recursive fashion*)
fun sum_cards (cs) =
  let
    fun aux (cs,acc) =
      case cs of
        [] => acc
        | c::cs' => aux(cs', card_value(c) + acc)
  in
    aux(cs,0)
  end

(*2-f*)
(*calculate score which takes card list as input and an int goal*)
fun score (cs, goal) =
  let
    val sum = sum_cards(cs)
    val prelim_score = if sum > goal then 3*(sum-goal) else (goal-sum)
  in
    if all_same_color (cs)
    then prelim_score div 2
    else prelim_score
  end


(*2-g*)
(**)
fun officiate (cards, moves, goal) =
  let
    fun aux (cards, moves, hold_list) =
      case moves of
        [] => score(hold_list, goal)
        | (Discard c)::moves' => aux(cards,moves',remove_card(cards,c,IllegalMove))
        | Draw::moves' => case cards of
                            [] => score(hold_list, goal)
                            | x::xs' => if sum_cards(x::hold_list) > goal
                                        then score(x::hold_list, goal)
                                        else aux(xs', moves', x::hold_list)
  in
    aux(cards, moves, [])
  end

