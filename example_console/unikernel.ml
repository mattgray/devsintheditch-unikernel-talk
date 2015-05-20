open Lwt

module Main (C: V1_LWT.CONSOLE) = struct

  let start c =
    lwt () =  OS.Time.sleep 5.0 in
    C.log c "hello unikernel world";
    return ()
end
