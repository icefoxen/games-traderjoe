(* markets.ml
   A market is the fundamental unit of economy, sorta.
   Basically, it's a collection of stockpiles of goods, 
   and a production and consumption rate for each.

   At the moment, prices are simply calculated by the amount
   of stockpile held, and the amount of surplus or deficit being
   generated.
*)


let ore = 0
and metal = 1
and numgoods = 2;;


let goodsArray () =
  Array.create numgoods 0
;;


(*
let getGoodAmount amounts good =
  amounts.(good)
;;

let addGoodAmount amounts good num =
  amounts.(good) <- amounts.(good) + num
;;
*)


class market =
object (self)
  val mutable stockpile = goodsArray ();
  val production = goodsArray ();
  val consumption = goodsArray ();

  method getStockpile = stockpile

  method getProduction = production

  method getConsumption = consumption

  method getProductionRate good =
    production.(good) - consumption.(good)

(*  method buy good n =

  method sell good n =
*)

  method calculate =
    let calcgood good amount =
      max 0 (amount + (self#getProductionRate good))
    in
      stockpile <- Array.mapi calcgood stockpile
    

  method getBuyPrice good =
    float_of_int stockpile.(good) 

  method getSellPrice good =
    float_of_int stockpile.(good)


  method toString =
    Printf.sprintf "%0.0f/%0.0f %8.0f/%0.0f"
      (self#getBuyPrice ore) (self#getSellPrice ore)
      (self#getBuyPrice metal) (self#getSellPrice metal)



end
