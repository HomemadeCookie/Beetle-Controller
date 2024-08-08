#include <ESP8266WiFi.h>
#include <WiFiClient.h>

const char* ssid = "Galaxy A13 C82E";
const char* password = "ezso9798";

const char* serverIP = "192.168.208.164";
const int serverPort = 3000;

WiFiClient client;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
  WiFi.begin(ssid, password);

  while (WiFi.status() != WL_CONNECTED){
    delay(1000);
    Serial.println("Connecting to WiFi...");  
  }
  Serial.println("Connected to WiFi");
}

void loop() {
  // put your main code here, to run repeatedly:
  if (client.connect(serverIP, serverPort)){
    Serial.println("Connected to server");
    client.println("GET /command HTTP/1.1");
    client.println("Host: " + String(serverIP));
    client.println("Connection: close");
    client.println();

    while(client.connected() || client.available()){
      if (client.available()){
        String line = client.readStringUntil('\n');
        Serial.println(line);
      } else {
        Serial.println("Connection to server failed");
      }

      delay(5000);
    }
  }
}
