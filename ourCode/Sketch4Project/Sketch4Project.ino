void setup() {
  // put your setup code here, to run once:

  begin(9600);
  
  //Initialization code:
  
  void initSDCard() {
    //Initialize SD card connection
  }

  void initSensor() {
    //Check that sensors read values
    //Calibrate ratio between accelerometers
    //Set ratio between pressure sensors maybe?
  }

  void setClockRate() {
    //Set clock rate for system?
  }

  //Functions for later:
  int getTime(startTime) {
    //Return the current time since start
  }

  void multiplex(whatSensor) {
    //Sets the output signal to the multiplexers depending on what sensor we want to read
  }
  
  int getSensorValue(whatSensor) {
    multiplex(whatSensor);
    //Returns the sensor value for the specified sensor
  }

  void addToArray(whatSensor) {
    //Adds values to the specified array
  }

  void clearArray(whatSensor) {
    //Clears array when it is full
  }

  void writeToSD(savedArray, whatSensor) {
    //Opens the file on SD card depending on whatSensor
    //Appends sensor values to opened file
    //Closes file again
  }
  
}

void loop() {

  while (digitalRead(onOffPin) == 0) {
    //On/off switch sends input to pin
    //While loop runs while pin is off and stops when pin is on
  }

  while (digitalRead(onOffPin) == 1) {
    //Monitor and save stuff to SD card
    for (i=1; i<= 10; i++) {
      getSensorValue(i);
      if (sizeof(savedArray) <= maxSize) {
        addToArray(i);
      } else {
        writeToSD(savedArray,i);
        clearArray(i);
      }
    }
  }
  

}
