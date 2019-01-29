module type S = sig
  type t

  val zero : t

  val one : t

  val hash : t -> int

  val equal : t -> t -> bool

  val pp : t Fmt.t

  val pred : t -> t

  val succ : t -> t

  val pred_safe : t -> t

  val succ_safe : t -> t

  val of_int : int -> t

  val to_string : t -> string

  val to_int : t -> int
end

module Make : S = struct
  type t = int64

  let zero = 0L

  let one = 1L

  let hash = Hashtbl.hash
  
  let equal = Int64.equal

  let pp ppf k = Fmt.pf ppf "@[%Ld]" k

  let pred = Int64.pred

  let succ = Int64.succ

  let pred_safe ck =
    if Int64.compare ck 0L <= 0 then
      failwith "Int64 wrapping down to negative"
    else
      Int64.pred ck
  
  let succ_safe ck =
    if Int64.compare ck Int64.max_int >= 0 then
      failwith "Int64 overflow"
    else
      Int64.succ ck
  
  let of_int n = Int64.of_int n
  
  let to_string = Int64.to_string

  let to_int ck = Int64.to_int ck
end
