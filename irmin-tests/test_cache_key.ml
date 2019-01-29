module CK = Cache_key.Make

let ck_t = Alcotest.testable CK.pp CK.equal

let test_int () =
  Alcotest.check
    Alcotest.int
    "To_int (Of_int i) = i"
    8 (CK.to_int (CK.of_int 8))

let test_pred_succ () =
  let n = CK.of_int 8 in
  Alcotest.check
    ck_t
    "succ (pred n) = n"
    n (CK.succ (CK.pred n))

let test_succ () =
  Alcotest.check
    ck_t
    "succ zero = one"
    CK.one (CK.succ CK.zero)

let test_succ_safe () =
  Alcotest.check
    ck_t
    "succ zero = one"
    CK.one (CK.succ_safe CK.zero)

let test = [
  "Int Conversion" , `Quick, test_int;
  "Succ Zero = One" , `Quick, test_succ;
  "Succ_safe Zero = One" , `Quick, test_succ_safe;
  "Succ (Pred n) = n" , `Quick, test_pred_succ;
]