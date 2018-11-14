//Reading stuff:
int forcePin = A0;
int forcePin2 = A1;
int forcePin3 = A2;
int forcePin4 = A3;
int forcePin5 = A4;
int forcePin6 = A5;
int forceReading = 0;
int forceReading2 = 0;
int forceReading3 = 0;
int forceReading4 = 0;
int forceReading5 = 0;
int forceReading6 = 0;
static unsigned long lastRead = 0;
const unsigned long READ_PERIOD = 10000;

/*--------------------------------------------------------------------*/

//Button on/off:
const int buttonPin = 3;
const int ledPin = 2;

int ledState = LOW;
int buttonState;
int lastButtonState = HIGH;

unsigned long lastDebounceTime = 0;
unsigned long debounceDelay = 500;

/*--------------------------------------------------------------------*/

//SD-card stuff:
#include <SPI.h>
#include <SD.h>

File dataFile;

const int chipSelect = 4;
String S1, S2, S3, S4, S5, S6, T1, string2write;
int closeStuff = 0;

//Sends the string:
void writeToSD(int sens1, int sens2, int sens3, int sens4, int sens5, int sens6) {
  S1 = String(sens1);
  S2 = String(sens2);
  S3 = String(sens3);
  S4 = String(sens4);
  S5 = String(sens5);
  S6 = String(sens6);
  T1 = String(millis());
  string2write = T1 + ";" + S1 + ";" + S2 + ";" + S3 + ";" + S4 + ";" + S5 + ";" + S6;
  //File dataFile = SD.open("data.txt", FILE_WRITE);
  dataFile.println(string2write);
  //dataFile.close();
}

//Collects a string before sending it:
/*String buildString(int sens1, int sens2, int sens3, int sens4) {
  S1 = String(sens1);
  S2 = String(sens2);
  S3 = String(sens3);
  S4 = String(sens4);
  T1 = String(millis());
  string2write = T1 + ";" + S1 + ";" + S2 + ";" + S3 + ";" + S4 + "\r\n";
  return string2write;
}*/

/*--------------------------------------------------------------------*/

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);

  //Button stuff:
  pinMode(buttonPin, INPUT);
  pinMode(ledPin, OUTPUT);
  digitalWrite(ledPin, ledState);

  //SD-card stuff:
  // see if the card is present and can be initialized:
  if (!SD.begin(chipSelect)) {
    Serial.println("Card failed, or not present");
    // don't do anything more:
    while (1);
  }
  Serial.println("card initialized.");

  //Create data file:
  dataFile = SD.open("data.txt", FILE_WRITE);
  dataFile.println("");
}

void loop() {

  //Button stuff:
  //read the button pin, if pressed will be high, if not pressed will be low
  int reading = digitalRead(buttonPin);
  //in the case that the reading is not equal to the last state set the last debounce time to current millis time
  if (reading != lastButtonState)  {
    lastDebounceTime = millis();
  }
  //check the difference between current time and last registered button press time, if it's greater than user defined delay then change the LED state as it's not a bounce
  if ((millis() - lastDebounceTime) > debounceDelay) {
    if (reading != buttonState) {
      buttonState = reading;
      if (buttonState == HIGH) {
        ledState = !ledState;
      }
    }
  }
  //set the LED
  digitalWrite(ledPin, ledState);

  //save the reading. next time through the loop the state of the reading will be known as the lastButtonState
  lastButtonState = reading;

  /*--------------------------------------------------------------------*/

  //Reading-stuff:
  if (ledState == HIGH && micros() - lastRead >= READ_PERIOD) {
    if (!dataFile) {
      dataFile = SD.open("data.txt", FILE_WRITE);
    }
    forceReading = analogRead(forcePin);
    forceReading2 = analogRead(forcePin2);
    forceReading3 = analogRead(forcePin3);
    forceReading4 = analogRead(forcePin4);
    forceReading5 = analogRead(forcePin5);
    forceReading6 = analogRead(forcePin6);

    if (closeStuff == 0) {
      lastRead = millis();
    } else {
      lastRead += READ_PERIOD;
    }

    /*if (lastSend == 10) {
      writeToSD(string2write);
      string2write = "";
    } else {
      
    }*/
    
    //Saving stuff:
    writeToSD(forceReading, forceReading2, forceReading3, forceReading4, forceReading5, forceReading6);

    closeStuff = 1;
  }

  if (closeStuff == 1 && ledState == LOW) {
    dataFile.close();
    closeStuff = 0;
  }
    
}
