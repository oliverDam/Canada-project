//Reading stuff:
int ForcePin = A0;
int ForcePin2 = A1;
int ForcePin3 = A2;
int ForcePin4 = A3;
int ForceReading = 0;
int ForceReading2 = 0;
int ForceReading3 = 0;
int ForceReading4 = 0;

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
//#include <SPI.h>
//#include <SD.h>

/*--------------------------------------------------------------------*/

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);

  //Button stuff:
  pinMode(buttonPin, INPUT);
  pinMode(ledPin, OUTPUT);
  digitalWrite(ledPin, ledState);

  //SD-card stuff:
  //SD.begin(4);
  //dataFile = SD.open("data.txt", FILE_WRITE);
  //dataFile.print("RF - RB - LF - LB");
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
  if ((millis()-lastDebounceTime) > debounceDelay) {
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
  if (ledState == HIGH) {
    ForceReading = analogRead(ForcePin);
    delay(10);
    ForceReading = analogRead(ForcePin);
    Serial.print("Sensor 1: ");
    Serial.println(ForceReading);
    //dataFile.print(ForceReading);
    //dataFile.print(" ~ ");
    ForceReading2 = analogRead(ForcePin2);
    delay(10);
    ForceReading2 = analogRead(ForcePin2);
    Serial.print("Sensor 2: ");
    Serial.println(ForceReading2);
    //dataFile.println(ForceReading2);
    ForceReading3 = analogRead(ForcePin3);
    delay(10);
    ForceReading3 = analogRead(ForcePin3);
    Serial.print("Sensor 3: ");
    Serial.println(ForceReading3);
    ForceReading4 = analogRead(ForcePin4);
    delay(10);
    ForceReading4 = analogRead(ForcePin4);
    Serial.print("Sensor 4: ");
    Serial.println(ForceReading4);
    delay(1500);
  }

    // ADD STUFF FOR SD-CARD closure https://randomnerdtutorials.com/guide-to-sd-card-module-with-arduino/
    
}
