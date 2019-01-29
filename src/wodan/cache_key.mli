module type S = sig
  type t

  val zero : t

  val one : t

  val hash : t -> int

  val equal : t -> t -> bool

  val pp : t Fmt.t

  val pred : t -> t

  val succ : t -> t

  (*
    Predecessor and successor function with no ill behaviour on the
    edge of the definition set.
    Raise Failure if we have reached the edge of the definition set.
  *)
  val pred_safe : t -> t

  val succ_safe : t -> t

  val of_int : int -> t

  val to_string : t -> string

  val to_int : t -> int
end

module Make : S