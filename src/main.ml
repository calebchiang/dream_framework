let () =
  Dream.run
  @@ Dream.logger
  @@ Dream.router [
    Dream.get "/" (fun _ ->
      Dream.html "<h1>Welcome to the Dream Framework</h1>
                  <p>Dream is a simple, type-safe web framework for OCaml.</p>");
    Dream.any "/" (fun _ -> Dream.empty `Not_Found)
  ]
