open Handlers

(** Entry point for web server *)
let () =
  Dream.run
  @@ Dream.logger
  @@ Dream.router [
    Dream.get "/" home_page;
    Dream.get "/introduction" introduction_page;
    Dream.get "/installation-and-setup" installation_and_setup_page;
    Dream.get "/routing" routing_page;
    Dream.get "/middleware" middleware_page;
    Dream.get "/templating-and-html-rendering" templating_and_html_rendering_page;
    Dream.get "/static/**" (Dream.static "public"); 
    Dream.any "/" (fun _ -> Dream.empty `Not_Found)
  ]

