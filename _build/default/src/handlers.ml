(** Function to include a sidebar and wrap content *)
let layout content =
  "<!DOCTYPE html>
   <html lang='en'>
   <head>
     <meta charset='UTF-8'>
     <meta name='viewport' content='width=device-width, initial-scale=1.0'>
     <title>Dream Framework</title>
     <link rel='stylesheet' href='/static/styles.css'>
     <link href='https://fonts.googleapis.com/css2?family=Lato:wght@300;400;700&display=swap' rel='stylesheet'>
     <link href='https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;700&display=swap' rel='stylesheet'>
     <link href='https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap' rel='stylesheet'>
   </head>
   <body>
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
     </div>
   </body>
   </html>"

(** Function for the homepage content *)
let home_page _ =
  Dream.html
    (layout "<h1> Welcome to the Dream Framework</h1>
             <p> Dream is a simple, type-safe web framework for OCaml. </p>
             ")

(** Function for the introduction page content *)
let introduction_page _ = 
  Dream.html
    (layout "<h1> Introduction </h1> 
             <p> Here is an introduction to the Dream framework. </p>
             
             <h2> Dream Offers: </h2> 
             <li> Functional Web Development </li> 
             <li> Middleware and Routes </li> 
             <li> HTML Templates </li> 
             <li> Error Handling </li> 
             <li> Simple Deployment Instructions </li> 

             <h2> Types </h2> 
             ")


(** Function for the installation and setup page content *)
let installation_and_setup_page _ =
  Dream.html
    (layout "<h1> Installation and Setup </h1>
             <p> A guide on how to install Dream, set up a basic project, and configure dependencies in OCaml.
              <h2> Getting Started </h2>

             <h4> Step 1: Install Dune and Dream </h4>
             <img class='dune_dream_install_img' src='/static/images/dune_dream_install.png' alt='dunedreaminstall'>

             <h4> Step 2: Create the Project Structure </h4>
             <p> Create a directory for your project: </p>
             <img class='create_project_img' src='/static/images/create_project.png' alt='createproject'>
             <p> Create necessary files: </p>
             <img class='create_files_img' src='/static/images/create_files.png' alt='createfiles'>

             <h4> Step 3: Configure the Project </h4>
             <p> dune-project file (at project root): </p>
             <img class='dune_project_config_img' src='static/images/dune_project_config.png' alt='duneprojectconfig'>

             <p> dune file in src directory: </p>
             <img class='dune_config_img' src='/static/images/dune_config.png' alt='duneconfig'>

              ")

(** Function for the middleware page content *)
let middleware_page _ = 
  Dream.html
    (layout "<h1> Middleware </h1>
             <p> Details the concepts of middleware in Dream and how it can be used for logging,
                 authentication, and request handling. ")



(** Function for the routing page content *)
let routing_page _ = 
  Dream.html
    (layout "<h1> Routing </h1>
             <p> How routing works in Dream, including examples of defining routes and handling different
                 HTTP methods. ")

(** Function for the Templating and HTML Rendering page content *)
let templating_and_html_rendering_page _ =
  Dream.html
    (layout "<h1> Templating and HTML Rendering </h1>
             <p> Overview of how to render HTML in Dream using Dream.html, and options for
                 integrating templating engines. ")
