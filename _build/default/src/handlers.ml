(* Function to include a sidebar and wrap content *)
let layout content =
  Dream.html
    ("<div style='display: flex;'>
        <nav style='width: 200px; padding: 1rem; background-color: #f4f4f4;'>
          <ul style='list-style: none; padding: 0;'>
            <li><a href='/'>Home</a></li>
            <li><a href='/introduction'>Introduction</a></li>
            <!-- Add more links for other topics as needed -->
          </ul>
        </nav>
        <div style='flex: 1; padding: 1rem;'>
          " ^ content ^ "
        </div>
      </div>")

(* Function for the homepage content *)
let home_page _ =
  layout "<h1> Welcome to the Dream Framework</h1>
          <p> Dream is a simple, type-safe web framework for OCaml. </p>"

(* Function for the introduction page content *)
let introduction_page _ = 
  layout "<h1> Introduction </h1> 
          <p> Here is an introduction to the Dream framework. </p>"