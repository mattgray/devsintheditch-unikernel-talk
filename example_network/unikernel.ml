open Lwt

module Main (C: V1_LWT.CONSOLE) (S: V1_LWT.STACKV4) = struct

  let start c s =
    S.listen_tcpv4 s ~port:8000 (fun flow ->
        S.TCPV4.read flow
        >>= function
        | `Ok buffer -> C.log_s c (Cstruct.to_string buffer) >> S.TCPV4.close flow
        | `Eof -> C.log_s c "read: eof"
        | `Error e -> C.log_s c "read: error"
      );

    S.listen s

end
