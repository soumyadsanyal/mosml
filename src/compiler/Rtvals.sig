(* Rtvals.sig *)

local
  open Obj Const Globals Types;
in

(* type ExnName = QualifiedIdent ref; cvr:removed *)

val getGlobalVal : int -> obj;
val setGlobalVal : int -> obj -> unit;
val getExnName : obj -> string
val getExnMessage : obj -> string
val printLiteralConst : obj -> unit;
val printDepth : int ref;
val printLength : int ref;
val printVal : TypeScheme -> obj -> unit;
val evalPrint : obj -> obj -> obj;
val evalInstallPP : obj -> (ppstream -> 'a -> unit) -> unit;
val resetGlobalDynEnv : unit -> unit;
val loadGlobalDynEnv : string -> (string * obj) list -> unit;

end;