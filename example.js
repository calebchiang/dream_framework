





let sharedCounter = 0; // Shared mutable state

function incrementCounter() {
  // Simulate an asynchronous operation with a delay
  setTimeout(() => {
    sharedCounter += 1; // Modify shared state
    console.log(`Counter: ${sharedCounter}`);
  }, 100);
}

// Start two tasks that modify the shared counter
incrementCounter();
incrementCounter();

console.log("Tasks started...");





