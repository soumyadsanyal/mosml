(* General and top-level *)

eqtype char
type   exn
eqtype int
eqtype real
eqtype string
eqtype unit

datatype bool      = false | true
datatype 'a list   = nil | op :: of 'a * 'a list
datatype order     = LESS | EQUAL | GREATER
datatype 'a ref    = ref of 'a 

exception Bind
exception Match
exception Interrupt

exception Subscript
exception Size
exception Fail of string

exception Overflow
exception Div
exception Domain

val =   : ''a * ''a -> bool
val <>  : ''a * ''a -> bool

(* Below, numtxt is int, Word.word, Word8.word, real, char, string: *)
val <   : numtxt * numtxt -> bool
val <=  : numtxt * numtxt -> bool
val >   : numtxt * numtxt -> bool
val >=  : numtxt * numtxt -> bool

(* Below, realint is int or real:                                       *)
val ~   : realint -> realint            (* raises Overflow              *)
val abs : realint -> realint            (* raises Overflow              *)
                                                                        
(* Below, num is int, Word.word, Word8.word, or real:                   *)
val +   : num * num -> num              (* raises Overflow              *)
val -   : num * num -> num              (* raises Overflow              *)
val *   : num * num -> num              (* raises Overflow              *)
val /   : real * real -> real           (* raises Div, Overflow         *)
                                                                        
(* Below, wordint is int, Word.word or Word8.word:                      *)
val div : wordint * wordint -> wordint  (* raises Div, Overflow         *)
val mod : wordint * wordint -> wordint  (* raises Div                   *)
                                                                        
val real   : int -> real                (* equals Real.fromInt          *)
val floor  : real -> int                (* round towards minus infinity *)
val ceil   : real -> int                (* round towards plus infinity  *)
val trunc  : real -> int                (* round towards zero           *)
val round  : real -> int                (* round to nearest even        *)

val o      : ('b -> 'c) * ('a -> 'b) -> ('a -> 'c)
val ignore : 'a -> unit
val before : 'a * 'b -> 'a

val !      : 'a ref -> 'a
val :=     : 'a ref * 'a -> unit

val vector : 'a list -> 'a vector

(* Non-standard types and exceptions *)

datatype 'a frag = QUOTE of string | ANTIQUOTE of 'a

exception Io of {function : string, name : string, cause : exn }
exception Graphic_failure of string
exception Out_of_memory
