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

            <h2> Concurrency in Dream </h2>
            <p> In imperative frameworks: </p>
            <li> Shared State: Mutable state is often shared between concurrent operations </li>
            <li> Manual Control: Developers manage concurrency explicitely using callbacks or promises </li>
            <li> Error-Prone: Shared state and manual synchronization can lead to deadlocks or bugs </li>
            <img class='javascript_concurrency_img' src='/static/images/javascript_concurrency.png' alt='javascriptconcurrency'>

            <p> Concurrency in Dream is based on Ocaml's Lwt library, which provides lightweight threads for asynchronous programming <p>
            <p> Lwt threads allow Dream to manage tasks concurrently, such as: </p>
            <li> Asynchronous Operations: Tasks like reading from a database, handling file I/O, or waiting for network responses are non blocking. 
            While one task is waiting, the server can process other requests. </li>

            <h3> How Dream Uses Lwt: </h3>
            <h4> 1.) Asynchronous Request Handling </h4>
            <p> Dream routes are asynchronous functions, so Lwt is used to handle tasks like reading a database or processing a file upload </p>
            <img class='lwt_img' src='/static/images/lwt.png' alt='lwt'>
            <p> In the handler function: </p>
            <li> Lwt_io.printl is used to asynchronously print \"Processing request\" to the console </li>
            <li> It returns a promise representing the asychronous operation </li>
            <li> The bind operator ( >>= ) is used to chain asynchronous operations. Once the message is printed, it continues to the next operation </li>
            <li> Dream.respond creates a response with the text \"Hello, Dream!\" which is sent back to the client </li>

            <p> Execution Flow: </p>
            <li> 1.) The program starts the server listening for HTTP requests </li>
            <li> 2.) When a client sends a get request to /, the server: </li> 
            <ul>
            <li> Logs the request using the Dream.logger middleware </li>
            <li> Routes the request to the handler function </li>
            </ul>
            <li> 3.) The handler function: </li>
            <ul> 
            <li> Prints \"Processing request\" to the console asynchronously </li>
            <img class='processing_request_img' src='/static/images/processing_request.png' alt='processingrequest'>

            <li> Responds with \"Hello, Dream!\" to the client </li>
            <img class='hello_dream_img' src='/static/images/hello_dream.png' alt='hellodream'>
            </ul>
            
            <h3> Benefits of Lwt in Dream </h3>
            <li> You can handle multiple request concurrently without blocking the server </li>
            <li> Dream abstracts most of the complexities of Lwt and simplifies asynchronous programming </li>
            <li> Many OCaml libraries for databases or filesystems provide Lwt-compatible API's </li>

            <p> Suppose you want to fetch user data from a database in a Dream handler: </p>
            <img class='fetch_user_img' src='/static/images/fetch_user.png' alt='fetchuser'>
            <p> Here, fetch_user_data simulates a non-blocking database query using Lwt_unix.sleep. The handler uses Lwt.bind ( >>= ) 
            to chain the asynchronous computation and send the result back as an HTTP response </p>

            <h3> Summary </h3>
            <li> Lwt provides the foundational asynchronous capabilities for Dream </li>
            <li> Dream uses Lwt to handle HTTP requests and responses without blocking the server </li>
            <li> Writing Dream applications involve woring directly with Lwt for async logic </li>


            
            
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
             <h2> Middleware in Dream</h2>
             <p> Middleware is a function that wraps around your application's request handling pipeline. It intercepts requests and responses to perform specific tasks </p>
             <p> Examples of this could include: </p>
             <li> Logging </li>
             <li> Authentication </li>
             <li> Error handling </li>
             <li> Cross-origin Resource Sharing (CORS) </li>
             <h2> Key Features of Middleware in Dream </h2>
             <h3> Composability: Middleware functions are composed using the @@ operator, allowing you to chain multiple layers of functions </h3>
             <p> e.g. Basic Logging Middleware: </p>
             <img class='middleware_img' src='static/images/middleware.png' alt='middleware'>
             <p> Terminal Output: </p>
             <img class='middleware_output_img' src='static/images/middleware_output.png' alt='middlewareoutput'>
             <li> The log_request function intercepts every incoming HTTP request </li>
             <li> It logs the message to the terminal </li>
             <li> After logging, it calls the next handler in the pipeline (handler request) </li>

             <h3> Dream.scope </h3>
             <p> Dream.scope groups routes under a common prefix (e.g. /api or /admin) and allows middleware to be applied specifically to those routes </p>
             <p> Example grouping routes under a specific path and applies middleware only to those routes: </p>
             <img class='scoped_img' src='static/images/scoped.png' alt='scoped'>
             <p> Public Route: </p>
             <li> Dream.get \"/\" handler_public defines a public route at / </li>
             <li> This route is accessible without any middleware </li>
             <li> Visiting / responds with This is a public page. </li>
             <img class='scoped_public_img' src='static/images/scoped_public.png' alt='scopedpublic'>
             <p> Scoped Route: </p>
             <li> Dream.scope groups routes under /scoped </li>
             <li> Middleware log_requests applies only to routes within this scope </li>
             <img class='scoped_scoped_img' src='static/images/scoped_scoped.png' alt='scopedscoped'>
             <p> Terminal Output: </p>
             <img class='scoped_terminal_img' src='static/images/scoped_terminal.png' alt='scopedterminal'>

             <h2> Benefits of Middleware in Dream </h2>
             <li> Modularity: Middleware seperates logic from route handlers, keeping code clean and maintainable </li>
             <li> Composability: Middleware functions allows easy chaining and layering of functionality </li>
             <li> Scoped Middleware: Middleware can be appied globabally or selectively to specific route groups using Dream.scope </li>
             <li> Reusabiity: Middleware functions can be reused across multiple parts of the application for consistent behaviour </li>
             ")


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
             <li> Dream.run starts the application and attaches the routing logic </li>
             <li> The @@ operator composes functions declaratively, passing the router to Dream.run </li>

             <h3> Dream.get </h3>
             <p> A function in the Dream framework that is used to define a route that responds to HTTP GET requests </p>
             <li> It specifies the path and the corresponding handler function that will proces requests to this path </li>
             <li> In the above example, Dream.get \"/\" handler_home maps the root URL to handler_home </li>
             <li> Dream.get \"/about\" handler_about maps /about to handler_about </li>

             <h3> Dream.post </h3>
             <p> Similiar to Dream.get, but designed to handle HTTP POST requests </p>
             <li> Typically used for sending data to the server, such as form submissions, API requests, or uploading files </li>

             <h2> Handler Functions </h2>
             <p> Handler functions are a fundamental part of a Dream application. They define how the application responds to incoming HTTP requests for specific routes. </p>
             <p> In the example below: </p>
             <img class='handler_functions_img' src='/static/images/handler_functions.png' alt='handlerfunctions'>
             <li> Handlers receive a Dream.request object which contains all the data about the incoming HTTP request (e.g. headers, query parameters, and body) </li>
             <li> Handlers return an Lwt.t containing a Dream.response, which the framework sends back to the client </li>


             <h2> Dynamic Routing </h2>
             <p> Dynamic routing allows your application to handle URL parameters, such as /user/:id where id changes based on requests </p>
             <li> Dream uses :name syntax in the route to define dynamic parts in the URL </li>
             <li> You can extract the value of these dynamic segments using Dream.param </li>
             <img class='dynamic_routing_img' src='/static/images/dynamic_routing.png' alt='dynamicrouting'>
             <li> The route /hello/:name contains a dynamic segment :name </li>
             <li> The Dream.param function retrieves the value of a named parameter from the URL </li>
             <li> The extracted value is used to create a personalized response. For example, if the URL
              is /hello/John, the handler responds with Hello, John! </li>
             <img class='hello_john_img' src='/static/images/hello_john.png' alt='hellojohn'>


             ")

(** Function for the Templating and HTML Rendering page content *)
let templating_and_html_rendering_page _ =
  Dream.html
    (layout "<h1> Templating and HTML Rendering </h1>
             <h2> Templating and HTML Rendering in Dream </h2>
             <p> Dream provides simple and flexible ways to render HTML responses
             <li> This includes integrating templating engines or directly generating HTML within handlers </li>
             <h3> Dream supports HTML rendering directly via Dream.html: </h3>
             <li> A helper function used to send HTML responses to the client </li>
             <p> Example: </p>
             <img class='html_img' src='/static/images/html.png' alt='html'>
             <li> The HTML content is passed as a string to Dream.html. This string contains static HTML content, including headings, a paragraph, and a list </li>
             <li> Dream.router will then map the route / to this handler function which will display the home page </li>
             
             <h3> Dynamic HTML with String Concatenation </h3>
             <p> This approach involves embedding variables or application data directly into an HTML string <p>
             <img class='dynamic_html_img' src='/static/images/dynamic_html.png' alt='dynamichtml'>
             <li> The title variable contains the page title, and the message variable holds a dynamic message </li>
             <li> OCaml's ^ operator concatenates the title and message into the final HTML structure </li>
             <p> Advantages of This Approach: </p>
             <li> Simplicity: Straightforward and doesn't require additional libraries </li>
             <li> Flexibility: Quickly generate dynamic pages with data embedded in the HTML </li>
             <li> Minimal Overhead: Ideal for small applications </li>

             <h3> Templating Engines </h3>
             <p> A tool used to create dynamic HTML pages by defining a structure of a webpage. This can be a template using a predefined HTML file or placeholders for dynamic content </p>
             <p> Advantages: </p>
             <li> Keeps the structure and style of the page seperate from the application logic </li>
             <li> Templates can include placeholders that are replaced with dynamic data at runtime, such as user names, lists, or API results </li>
             <li> Templates make HTML easier to read and modify </li>
  

             
             
             
             ")







