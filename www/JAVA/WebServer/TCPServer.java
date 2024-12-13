
/**
 * Implementazione di un server web utilizzando la comunicazione tramite socket.
 * Lettura dati multi riga provenienti dal client
 * 
 * from folder network/..
 * javac network/TcpServer.java; java network.TcpServer 
 */

import java.io.*;
import java.net.ServerSocket;
import java.net.Socket;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class TCPServer {
	public static void main(String[] args) throws Exception {
		
		final int SERVER_PORT=8765;
		String clientMsg = "";
		
		try {			 
			// Creazione del socket sul server e ascolto sulla porta
			ServerSocket serverSocket = new ServerSocket(SERVER_PORT);
			System.out.println("Server: in ascolto sulla porta " + SERVER_PORT);

			boolean endConn=false;
			while(!endConn) {
				// Attesa della connessione con il client
				System.out.println("Attesa ricezione dati dal client ....................... \n");
				Socket clientSocket = serverSocket.accept();
				
				// Create output stream to write data and input stream to read data from socket
				DataOutputStream outStream = new DataOutputStream(clientSocket.getOutputStream());	
				BufferedReader inStream = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));
	
				// ---------------------------------------------------------
                //Lettura dati dal client un riga alla volta   
                String checkLine = inStream.readLine();
                clientMsg = checkLine;
                
                do{
                    System.out.println(checkLine);
                } while ((clientMsg = inStream.readLine()).length() != 0);
                    

				// Elaborare qui i dati ricevuti dal client 
                // ---------------------------------------------------------
                
                // Invio dei dati su stream di rete al client

                Termometro termometro = new Termometro();
                double term_val = termometro.getTemp();

                
                if (checkLine.toLowerCase().contains("/favicon.ico")) {
                    // Legge il file favicon.ico dalla directory locale
                    File favicon = new File("./favicon.ico");
                    if (favicon.exists()) {
                        FileInputStream fileInputStream = new FileInputStream(favicon);
                        byte[] iconBytes = fileInputStream.readAllBytes();
                        fileInputStream.close();

                        // Header HTTP per il file favicon.ico
                        clientMsg = "HTTP/1.1 200 OK\r\n";
                        clientMsg += "Content-Type: image/x-icon\r\n";
                        clientMsg += "Content-Length: " + iconBytes.length + "\r\n";
                        clientMsg += "\r\n";

                        // Invio dell'header
                        outStream.write(clientMsg.getBytes());
                        // Invio del contenuto del file
                        outStream.write(iconBytes);
                    }
                }
                else if (checkLine.toLowerCase().contains("/accendi")) {
                    // Invio dei dati su stream di rete al client
                    clientMsg = "HTTP/1.1 200 OK\r\n";
                    // clientMsg += "Connection: close\r\n";
                    // clientMsg += "Content-Type: text/plain\r\n";
                    clientMsg += "\r\n";
                    clientMsg += "Acceso";
                }
                else if (checkLine.toLowerCase().contains("/spegni")) {
                    // Invio dei dati su stream di rete al client
                    clientMsg = "HTTP/1.1 200 OK\r\n";
                    // clientMsg += "Connection: close\r\n";
                    // clientMsg += "Content-Type: text/plain\r\n";
                    clientMsg += "\r\n";
                    clientMsg += "Spento";
                }
                else{
                    clientMsg = "HTTP/1.1 200 OK\r\n";
                    // clientMsg += "Connection: close\r\n";
                    // clientMsg += "Content-Type: text/plain\r\n";
                    clientMsg += "\r\n";
                    Path filePath = Paths.get("./termometro.html"); // Percorso del file HTML
        
                    String content = Files.readString(filePath);

                    content = content.replace("term_val", String.valueOf(term_val));
                    System.out.println(content);

                    clientMsg += content; // Stampa il contenuto completo del file HTML
        
                }
                
                
                outStream.write(clientMsg.getBytes());
                
				outStream.flush();

				System.out.println("\n....................... Fine ricezione dati\n");
				// Close resources
				clientSocket.close();
				inStream.close();
				outStream.close();
			}

			// Close resources
			serverSocket.close();

		} catch (Exception e) {
			System.out.println(e);
		}
	}
}