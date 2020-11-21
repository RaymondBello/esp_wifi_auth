#include <ESP8266WiFi.h>

String ssid; 
String wifi_password; 

WiFiServer server(80); 

void setup() {
  pinMode(LED_PIN, OUTPUT); 
  Serial.begin(9600); 
  delay(3000);
  Serial.println(); 
  while(ssid == "") {
    Serial.println("Enter your SSID: "); 
    ssid = Serial.readString();
    } 
  while(wifi_password == "") {
    Serial.println("Enter your WiFi password: "); 
    wifi_password = Serial.readString();
    }
  ssid.replace("\n", ""); 
  wifi_password.replace("\n", ""); 
  Serial.print("SSID: "); 
  Serial.println(ssid); 
  Serial.println("Password you entered has " + String(wifi_password.length()) + " characters!"); 

  Serial.print("Now connecting to: "); 
  Serial.println(ssid); 

  WiFi.begin(ssid, wifi_password); 
  Serial.println("Connecting...");
  
  while(WiFi.status() != WL_CONNECTED) {
    delay(500);  
    Serial.print("."); 
    }
  Serial.println(" "); 
  Serial.println("Connected to your network!"); 

  server.begin(); 
  Serial.println("Server started!"); 

  Serial.println("Use this URL to connect: "); 
  Serial.print("http://");
  Serial.println(WiFi.localIP()); 

}