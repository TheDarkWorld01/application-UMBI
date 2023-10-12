#include <WiFi.h>
#include <WebServer.h>
#include <ESP32Servo.h>

Servo myServo;

const char *ssid = "alex";
const char *password = "12345678";

WebServer server(80);

void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
  myServo.attach(12);
  
  WiFi.begin(ssid,password);

  while(WiFi.status() != WL_CONNECTED){
    delay(1000);
    Serial.println("Koneksi ke Wifi....");  
  }

  Serial.println(WiFi.localIP());
  Serial.println("Berhasil Konek ke wifi");

  server.on("/parameter", HTTP_GET,[](){
     String paramValue = server.arg("param");
     String message = "Parameter yang diterima: " + paramValue;

      if(paramValue == "buka"){
          delay(1000);
          myServo.write(90);
        } else if (paramValue == "tutup"){
          delay(1000);
          myServo.write(0);
        }else {
          String message = "Salah menangkap parameter";
        }
     server.send(200, "text/plain", message);
  });

  server.begin();
  Serial.print("Server Started");
}

void loop() {
  // put your main code here, to run repeatedly:
  server.handleClient();
}
