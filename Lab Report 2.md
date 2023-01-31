# Lab Report 2
## Part 1
### Server.java (from the lab):
```
// A simple web server using Java's built-in HttpServer

// Examples from https://dzone.com/articles/simple-http-server-in-java were useful references

import java.io.IOException;
import java.io.OutputStream;
import java.net.InetSocketAddress;
import java.net.URI;

import com.sun.net.httpserver.HttpExchange;
import com.sun.net.httpserver.HttpHandler;
import com.sun.net.httpserver.HttpServer;

interface URLHandler {
    String handleRequest(URI url);
}

class ServerHttpHandler implements HttpHandler {
    URLHandler handler;
    ServerHttpHandler(URLHandler handler) {
      this.handler = handler;
    }
    public void handle(final HttpExchange exchange) throws IOException {
        // form return body after being handled by program
        try {
            String ret = handler.handleRequest(exchange.getRequestURI());
            // form the return string and write it on the browser
            exchange.sendResponseHeaders(200, ret.getBytes().length);
            OutputStream os = exchange.getResponseBody();
            os.write(ret.getBytes());
            os.close();
        } catch(Exception e) {
            String response = e.toString();
            exchange.sendResponseHeaders(500, response.getBytes().length);
            OutputStream os = exchange.getResponseBody();
            os.write(response.getBytes());
            os.close();
        }
    }
}

public class Server {
    public static void start(int port, URLHandler handler) throws IOException {
        HttpServer server = HttpServer.create(new InetSocketAddress(port), 0);

        //create request entrypoint
        server.createContext("/", new ServerHttpHandler(handler));

        //start the server
        server.start();
        System.out.println("Server Started! Visit http://localhost:" + port + " to visit.");
    }
}
```
### StringServer.java:
```
import java.io.IOException;
import java.net.URI;

class StringHandler implements URLHandler {
    String message = "";

    @Override
    public String handleRequest(URI url) {
        String urlPath = url.getPath();
        if (urlPath.equals("/add-message")) {
            String[] parameters = url.getQuery().split("=");
            if (parameters[0].equals("s")) {
                message += parameters[1] + "\n";
                return message;
            }
        }

        System.out.println("Path: " + url.getPath());
        return "404 Not Found!";
    }

}

class StringServer {
    public static void main(String[] args) throws IOException {
        if (args.length == 0) {
            System.out.println("Missing port number! Try any number between 1024 to 49151");
            return;
        }

        int port = Integer.parseInt(args[0]);

        Server.start(port, new StringHandler());
    }
}
```
![Server1](https://drive.google.com/uc?export=view&id=1hVL39VUL5zffYbwvTmDDAsC0109gZXke)

In this screenshot, the handleRequest method is called. The argument is the whole URI, `http://localhost:4000/add-message?s=Top Text` (note the %20 is converted into the space character). The only instance variable in the class is the String message which starts empty. The url is parsed for the path, `/add-message?s=Top Text`, and stored in the urlPath variable. Afterwards, the urlPath is parsed for the quarry, `Top Text`, and that is added to the message instance variable along with a new line. This means the message variable now contains `Top Text\n`.

![Server2](https://drive.google.com/uc?export=view&id=1RYA9LRaSxpzvTY5O0xP9RUVXJpRtzj3a)

In this screenshot, the handleRequest method is called again. The argument is the whole URI, `http://localhost:4000/add-message?s=Top Bottom`. The only instance variable in the class is the String message which currently contains `Top Text\n`. The url is parsed for the path, `/add-message?s=Bottom Text`, and stored in the urlPath variable. Afterwards, the urlPath is parsed for the quarry, `Bottom Text`, and that is added to the message instance variable along with a new line. This means the message variable now contains `Top Text\nBottom Text\n`.

## Part 2
The buggy code that we will be looking at is the averageWithoutLowest method.

Failure inducing test:
```
@Test
public void testAverageWithoutLowest1() {
    double [] input1 = {1,2,3,1};
    assertEquals(2, ArrayExamples.averageWithoutLowest(input1), .00000001);    
}
```
Non failure inducing test:
```
@Test
public void testAverageWithoutLowest2() {
    double [] input1 = {1,2,3};
    assertEquals(2.5, ArrayExamples.averageWithoutLowest(input1), .00000001);    
}
```
Symptoms:

![Tests](https://drive.google.com/uc?export=view&id=1gmABVPbWzhEY8Ic4Egz8IQfFNvvaspIg)
The first test fails showing the symptom.

The bug is that all numbers that are the lowest are being excluded from the sum.
```
static double averageWithoutLowest(double[] arr) {
    if(arr.length < 2) { return 0.0; }
    double lowest = arr[0];
    for(double num: arr) {
        if(num < lowest) { lowest = num; }
    }
    double sum = 0;
    for(double num: arr) {
        if(num != lowest) { sum += num; }
    }
    return sum / (arr.length - 1);
}
```
To fix this, we add a boolean that tracks if we have already excluded one of the lowest values. If we have, we don't exclude any more values.
```
static double averageWithoutLowest(double[] arr) {
    if(arr.length < 2) { return 0.0; }
    double lowest = arr[0];
    for(double num: arr) {
        if(num < lowest) { lowest = num; }
    }
    double sum = 0;
    boolean passedLow = false;
    for(double num: arr) {
        if (passedLow || num != lowest) {
            sum += num;
        } else {
            passedLow = true;
        }
    }
    return sum / (arr.length - 1);
}
```
## Part 3
In the past two labs, I learned how to setup a web server in Java. I also learned how to handle different paths and quarries.