(** Function to include a sidebar and wrap content *)
let layout content =
  Dream.html
    ("<link rel='stylesheet' href='/static/styles.css'>
      <div class='container'>
        <nav class='sidebar'>
          <ul>
            <li><a href='/'>Home</a></li>
            <li><a href='/introduction'>Introduction</a></li>
            <li><a href='/installation-and-setup'>Installation and Setup</a></li>
            <li><a href='/routing'>Routing</a></li>
            <li><a href='/middleware'>Middleware</a></li>
            <li><a href='/templating-and-html-rendering'>Templating and HTML Rendering</a></li>
          </ul>
        </nav>
        <main class='content'>
          " ^ content ^ "
        </main>
      </div>")


(** Function for the homepage content *)
let home_page _ =
  layout "<h1> Welcome to the Dream Framework</h1>
          <p> Dream is a simple, type-safe web framework for OCaml. </p>"

(** Function for the introduction page content *)
let introduction_page _ = 
  layout "<h1> Introduction </h1> 
          <p> Here is an introduction to the Dream framework. </p>"


(** Function for the installation and setup page content *)
let installation_and_setup_page _ =
  layout "<h1> Installation and Setup </h1>
          <p> A guide on how to install Dream, set up a basic project, and configure dependencies in Ocaml."


(** Function for the routing page content *)
let routing_page _ = 
  layout "<h1> Routing </h1>
          <p> How routing works in Dream, including examples of defining routes and handling different
              HTTP methods. "

(** Function for the middleware page content *)
let middleware_page _ = 
  layout "<h1> Middleware </h1>
          <p> Details the concepts of middleware in Dream and how it can be used for logging,
              authentication, and request handling. "

(** Function for the Templating and HTML Rendering page content *)
let templating_and_html_rendering_page _ =
  layout "<h1> Templating and HTML Rendering </h1>
          <p> Overview of how to render HTML in Dream using Dream.html, and options for
              integrating templating engines. "
