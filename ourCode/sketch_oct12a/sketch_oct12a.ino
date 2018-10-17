//Reading stuff:
int ForcePin = A1;
int ForcePin2 = A2;
int ForcePin3 = A3;
int ForceReading = 0;
int ForceReading2 = 0;
int ForceReading3 = 0;
int inPin = 2;
int reading;

//SD-card stuff:
//#include <SPI.h>
//#include <SD.h>

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  pinMode(LED_BUILTIN, OUTPUT);

  //SD-card stuff:
  //SD.begin(4);
  //dataFile = SD.open("data.txt", FILE_WRITE);
  //dataFile.print("RF - RB - LF - LB");
}

void loop() {
  reading = digitalRead(inPin);
  Serial.println(reading);
  delay(200);
  if (reading == HIGH) {
    ForceReading = analogRead(ForcePin);
    Serial.print("Small sensor:");
    Serial.println(ForceReading);
    //dataFile.print(ForceReading);
    //dataFile.print(" ~ ");
    delay(200);
    ForceReading2 = analogRead(ForcePin2);
    Serial.print("Big sensor:");
    Serial.println(ForceReading2);
    //dataFile.println(ForceReading2);
    delay(200);
    ForceReading3 = analogRead(ForcePin3);
    Serial.print("Jack sensor:");
    Serial.println(ForceReading3);
    delay(200);
    digitalWrite(LED_BUILTIN, HIGH);
  } else {
    digitalWrite(LED_BUILTIN, LOW);

    // ADD STUFF FOR SD-CARD closure https://randomnerdtutorials.com/guide-to-sd-card-module-with-arduino/
    
  }
}
