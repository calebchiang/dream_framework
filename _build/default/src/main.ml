open Handlers

(** Entry point for web server *)
let () =
  Dream.run
  @@ Dream.logger
  @@ Dream.router [
    Dream.get "/" home_page;
    Dream.get "/introduction" introduction_page;
    Dream.get "/static/**" (Dream.static "public"); 
    Dream.any "/" (fun _ -> Dream.empty `Not_Found)
  ]
