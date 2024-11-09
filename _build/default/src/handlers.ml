(* Function to include a sidebar and wrap content *)
let layout content =
  Dream.html
    ("<link rel='stylesheet' href='/static/styles.css'>
      <div class='container'>
        <nav class='sidebar'>
          <ul>
            <li><a href='/'>Home</a></li>
            <li><a href='/introduction'>Introduction</a></li>
            <!-- Add more links as needed -->
          </ul>
        </nav>
        <main class='content'>
          " ^ content ^ "
        </main>
      </div>")


(* Function for the homepage content *)
let home_page _ =
  layout "<h1> Welcome to the Dream Framework</h1>
          <p> Dream is a simple, type-safe web framework for OCaml. </p>"

(* Function for the introduction page content *)
let introduction_page _ = 
  layout "<h1> Introduction </h1> 
          <p> Here is an introduction to the Dream framework. </p>"