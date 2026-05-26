# IR-Remote-Appliance-control-ESP32
Voice controlled home appliances using IR Remote and ESP32 on Wokwi simulator. Controls Light, Fan and AC using LEDs and LCD display.

A mini project to control home appliances using IR Remote and ESP32.

## Components Used
- ESP32
- IR Remote
- IR Receiver
- 16x2 LCD with I2C
- 3 LEDs (Blue, Yellow, Red)
- 220 ohm Resistors
- Breadboard
- Jumper Wires

## How It Works
Press buttons on IR Remote to control appliances.
LCD shows live status of all appliances.

## Button Mapping
| Button | Appliance |
|--------|-----------|
| 1 | Light ON/OFF |
| 2 | Fan ON/OFF |
| 3 | AC ON/OFF |
| 0 | All OFF |

## Circuit Connections
| Component | ESP32 Pin |
|-----------|-----------|
| IR Receiver OUT | GPIO 15 |
| LCD SDA | GPIO 21 |
| LCD SCL | GPIO 22 |
| Light LED | GPIO 26 |
| Fan LED | GPIO 27 |
| AC LED | GPIO 14 |

## Simulated On Wokwi Simulator
https://wokwi.com/projects/465069401872353281

































## Made By
Your Name Here
