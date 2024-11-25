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
             <h2> Dream Offers: </h2> 
             <li> Functional Web Development </li> 
             <li> Middleware and Routes </li> 
             <li> HTML Templates </li> 
             <li> Error Handling </li> 
             <li> Simple Deployment Instructions </li> 
             ")

(** Function for the introduction page content *)
let introduction_page _ = 
  Dream.html
    (layout "<h1> Introduction </h1> 
             <h2> What is a Web Framework? </h2>
        
             <p> A web framework is a set of tools and code that helps developers build websites or web applications. </p>
             <li> Routing: Deciding what content to show when a user visits a specific URL. </li>
             <li> Handling HTTP Requests and Responses: Managing communication between web browser and server. </li>
             <li> Middleware: Functionality to requests and responses, like authentication. </li>
             <li> Database Interactions: Connect and query to a database </li>

             <p> Most programming languages have their own web frameworks: </p>
             <li> Python: Django </li>
             <li> JavaScript: Express (Node.js) </li>
             <li> OCaml: Dream, Opium </li>
             <img class='web_frameworks_img' src='/static/images/web_frameworks.png' alt='webframework'>
            
             <h2> Functional Web Development and the Dream Framework</h2>
             <p> Functional web frameworks differ from imperative focused languages in several key ways: </p>
             <h3> 1.) Immutability and Statelessness </h3>
             <p> Request and Response Handling: </p>
             <li> Each HTTP request and response is treated as an independent piece of data </li>
             <li> With Dream, requests and responses are not modified. Instead, handlers process the input (request) and produce new output (response) </p>

             <img class='imperative_img' src='/static/images/imperative_code.png' alt='imperativecode'>
             <img class='functional_img' src='/static/images/functional_code.png' alt='functionalcode'>
             
             <table class='imperative-vs-functional-table'>
               <thead>
                 <tr>
                   <th></th>
                   <th>Express</th>
                   <th>Dream</th>
                 </tr>
               </thead>
               <tbody>
                 <tr>
                   <td>Response Mutability</td>
                   <td>The res object is modified directly, changing its state in place </td>
                   <td>The response object is immutable; each change creates a new one</td>
                 </tr>
                 <tr>
                   <td>Side Effects</td>
                   <td>If middleware modifies res, it can accidentally affect the response</td>
                   <td>Each function operates independently without altering shared state</td>
                 </tr>
                 <tr>
                   <td>Concurrent Safety</td>
                   <td>Shared mutable res requires careful handling in multi-threaded apps</td>
                   <td>Immutable objects are naturally safe for concurrent environements</td>
                 </tr>
               </tbody>
             </table>

            <h3> 2.) Strong Type Systems </h3>
            <p> One of the core features of OCaml is their strong type systems:
            <li> Types are enforced at compile time </li>
            <li> Catches errors in the code before it runs </li>
            <p> In contrast, languages like JavaScript uses a weak and dynamic type system making it easier to write code that is error-prone: </p>
            <img class='javascript_type_img' src='/static/images/javascript_type.png' alt='javascripttype'>
            <li> The req.query.name field is assumed to be a string </li>
            <li> There is no guarantee that name exists or is of the correct type </li>

            <img class='ocaml_type_img' src='/static/images/ocaml_type.png' alt='ocamltype'>
            <li> The Dream.query function returns an option type (Some name if the query parameter exists, or None) </li>
            <li> If you forget to handle None case, the code won't compile </li>
            <li> No risk of runtime errors </li>

            <h3> 3.) Function Composition </h3>
            <p> Middleware and handlers are treated as functions that take inputs and returns outputs, without modifying anything in place. Functions can be combined declaretively using the @@ operator forming a clear and predicable pipeline. </p>
            <p> Why Function Composition Matters in Dream: </p>
            <li> Modularity: Functions are independent, making them reusable </li>
            <li> Clarity: Composition creates a clear, declarative flow of operations </li>
            <li> Debugging: Each function is predicable, making debugging simpler </li>

            <h3> 4.) Concurrency and Asynchronous Programming </h3>
            <p> In imperative frameworks: </p>
            <li> Shared State: Mutable state is often shared between concurrent operations </li>
            <li> Manual Control: Developers manage concurrency explicitely using callbacks or promises </li>
            <li> Error-Prone: Shared state and manual synchronization can lead to deadlocks or bugs </li>
            <img class='javascript_concurrency_img' src='/static/images/javascript_concurrency.png' alt='javascriptconcurrency'>

            <h4> Concurrency in Dream </h4>
            <p> Concurrency in Dream is based on Ocaml's Lwt library, which provides lightweight threads for asynchronous programming <p>
            <p> Lwt threads allow Dream to manage tasks concurrently, such as: </p>
            <li> Asynchronous Operations: Tasks like reading from a database, handling file I/O, or waiting for network responses are non blocking. 
            While one task is waiting, the server can process other requests. </li>
            
            <p> You can compose tasks with Lwt.join or Lwt.bind: </p>
            <img class='ocaml_concurrency_img' src='/static/images/ocaml_concurrency.png' alt='ocamlconcurrency'>
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
             <h2> What is Routing? </h2>
             <p> Routing determines how a web application responds to a client's request for a specific URL or endpoint. </p>
             <li> Allows developers to organize application logic </li>
             <li> Enables creating dynamic websites or multi-page applications </li>
             <p> Dream uses a declarative style for defining routes: </p>
             <li> Routes are defined in a router, which maps HTTP methods (GET, POST, etc.) and paths to handler functions </li>
             <img class='routing_img' src='/static/images/routing.png' alt='routing'>
             <p> How routing works in Dream: </p>
             <li> Dream.router maps URL paths to handler functions </li>
             <li> Dream.get \"/\" handler_home maps the root URL to handler_home </li>
             <li> Dream.get \"/about\" handler_about maps /about to handler_about </li>
             <li> Dream.run starts the application and attaches the routing logic </li>
             <li> The @@ operator composes functions declaratively, passing the router to Dream.run </li>

             <h2> Handler Functions </h2>
             <p> Handler functions are a fundamental part of a Dream application. They define how the application responds to incoming HTTP requests for specific routes. </p>
             <p> In the example below: </p>
             <img class='handler_functions_img' src='/static/images/handler_functions.png' alt='handlerfunctions'>
             <li> Handlers receive a Dream.request object which contains all the data about the incoming HTTP request (e.g. headers, query parameters, and body) </li>
             <li> Handlers return an Lwt.t containing a Dream.response, which the framework sends back to the client </li>




             
             
             ")

(** Function for the Templating and HTML Rendering page content *)
let templating_and_html_rendering_page _ =
  Dream.html
    (layout "<h1> Templating and HTML Rendering </h1>
             <p> Overview of how to render HTML in Dream using Dream.html, and options for
                 integrating templating engines. ")







