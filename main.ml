

open Market


let _ =
  let m = new market in
    m#getProduction.(ore)    <- 50;
    m#getProduction.(metal)  <- 30;

    m#getConsumption.(ore)   <- 30;
    m#getConsumption.(metal) <- 50;

    m#getStockpile.(ore)   <- 1000;
    m#getStockpile.(metal) <- 1000;

    print_endline "Ore\t\tMetal";

    for i = 0 to 100 do
      m#calculate;
      print_endline m#toString;
    done;
;;
