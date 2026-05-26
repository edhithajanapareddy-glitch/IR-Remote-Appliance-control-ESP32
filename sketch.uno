#include <Wire.h>
#include <LiquidCrystal_I2C.h>
#include <IRremote.h>

LiquidCrystal_I2C lcd(0x27, 16, 2);

#define IR_PIN    15
#define LIGHT_PIN 26
#define FAN_PIN   27
#define AC_PIN    14

bool lightOn = false;
bool fanOn   = false;
bool acOn    = false;

#define BTN_1   0x1
#define BTN_2   0x2
#define BTN_3   0x3
#define BTN_0   0x0

void updateLCD() {
  lcd.clear();
  lcd.setCursor(0, 0);
  lcd.print("L:");
  lcd.print(lightOn ? "ON " : "OFF");
  lcd.print(" F:");
  lcd.print(fanOn ? "ON " : "OFF");
  lcd.setCursor(0, 1);
  lcd.print("AC:");
  lcd.print(acOn ? "ON " : "OFF");
}

void toggleAppliance(String name, bool &state, int pin) {
  state = !state;
  digitalWrite(pin, state ? HIGH : LOW);
  Serial.print(name);
  Serial.println(state ? " ON" : " OFF");
  updateLCD();
}
void setup() {
  Serial.begin(115200);
  lcd.init();
  lcd.backlight();
  lcd.setCursor(0, 0);
  lcd.print("IR Appliance");
  lcd.setCursor(0, 1);
  lcd.print("Control Ready!");
  delay(2000);
  lcd.clear();

  pinMode(LIGHT_PIN, OUTPUT);
  pinMode(FAN_PIN,   OUTPUT);
  pinMode(AC_PIN,    OUTPUT);

  IrReceiver.begin(IR_PIN, ENABLE_LED_FEEDBACK);
  updateLCD();
}

void loop() {
  if (IrReceiver.decode()) {
    long code = IrReceiver.decodedIRData.command;

    if (code == BTN_1)      toggleAppliance("Light", lightOn, LIGHT_PIN);
    else if (code == BTN_2) toggleAppliance("Fan",   fanOn,   FAN_PIN);
    else if (code == BTN_3) toggleAppliance("AC",    acOn,    AC_PIN);
    else if (code == BTN_0) {
      lightOn = false; fanOn = false; acOn = false;
      digitalWrite(LIGHT_PIN, LOW);
      digitalWrite(FAN_PIN,   LOW);
      digitalWrite(AC_PIN,    LOW);
      updateLCD();
    }

    IrReceiver.resume();
  }
}

