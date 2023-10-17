#include <TinyGPS++.h>

// Gunakan Serial2 untuk komunikasi dengan modul GPS
HardwareSerial gpsSerial(2); // RX pada ESP32 terhubung ke TX pada modul GPS, dan sebaliknya (GPIO 16 = RX, GPIO 17 = TX)

TinyGPSPlus gps;

void setup() {
  Serial.begin(9600);
  gpsSerial.begin(9600);
}

void loop() {
  while (gpsSerial.available() > 0) {
    if (gps.encode(gpsSerial.read())) {
      if (gps.location.isUpdated()) {
        double lat = gps.location.lat();
        double lon = gps.location.lng();
        Serial.print("Latitude: ");
        Serial.println(lat, 6);
        Serial.print("Longitude: ");
        Serial.println(lon, 6);
      }
    }
  }
}
