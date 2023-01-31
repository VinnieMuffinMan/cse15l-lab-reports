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
