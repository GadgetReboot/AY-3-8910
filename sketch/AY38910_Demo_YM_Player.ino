/*
   AY-3-8910 Demo using Arduino Nano

   Based on AY3891x Library Example Sketch 7: Play chiptunes data from SD card
   Using the AY3891x library:  https://github.com/Andy4495/AY3891x

   Schematic: https://github.com/GadgetReboot/AY-3-8910

   This demo plays some test tones and noises using the AY3891x library to configure
   the chip registers.
   Then any existing YM sound files are sequentially played from an SD card.

   Tested with Arduino IDE 1.8.13

   Gadget Reboot
   https://www.youtube.com/gadgetreboot

*/

#include <Arduino.h>
#include "AY3891x.h"
#include "AY3891x_sounds.h"  // contains the divisor values for musical note frequencies
#include "SD.h"

const byte notUsed = 255;    // the library considers 255 to mean pin not used when configuring AY3891x pins

//          these are the Nano pins used in the schematic to interface with the AY-3-8910
//          DA7, DA6, DA5, DA4, DA3, DA2, DA1, DA0, BDIR, BC2, BC1, A9, A8, Reset, Clock
AY3891x psg( A3,   8,   7,   6,   5,   4,   3,   2,   A2,  A1,  A0, notUsed, notUsed, A4, notUsed);

// YM playback timing
// write the data at a rate of 50 Hz <-> every 20000 us
unsigned long prev_micros = 0;
#define INTERVAL 20000

#define CS   10                 // SD card chip select pin
#define NEXT_BUTTON 19          // A5/SCL pin is used as an input to skip to next YM file on SD card
#define KEYBOUNCE_DELAY 20      // 20 ms button debounce interval
unsigned long last_button = 0;  // debounce timer 

// 2 MHz clock generator for the Nano 328p
#ifdef ARDUINO_ARCH_AVR
#define HARDWARE_GENERATED_CLOCK  
#ifdef HARDWARE_GENERATED_CLOCK
// The following code generates an approximate 2 MHz 50% duty cycle output to be used
// as the clock signal for the AY-3-891x chip.
// Note that the following code is hardware-specific. It works on certain Atmega
// chips (including Arduino UNO), but will not work on all microcontrollers
// without modification
static const byte clkOUT = 9;  // clock output pin
const byte DIVISOR = 3;        // set for approximate 2 MHz clock
static void clockSetup()
{
  TCCR1A = (1 << COM1A0);
  TCCR1B = (1 << WGM12) | (1 << CS10);
  TCCR1C = 0;
  TIMSK1 = 0;
  OCR1AH = 0;
  OCR1AL = DIVISOR;
}
#endif
#endif

// SD card and playback related
File root;
File current_song;
enum State {PLAYING, GETNEXT, NOMOREFILES, BUTTONRELEASE};
State state;

void setup() {
#ifdef HARDWARE_GENERATED_CLOCK
  // Hardware-specific microcontroller code to generate a clock signal for the AY-3-891x chip
  pinMode(clkOUT, OUTPUT);
  digitalWrite(clkOUT, LOW);
  clockSetup();
#endif

  Serial.begin(9600);

  pinMode(CS, OUTPUT);
  pinMode(NEXT_BUTTON, INPUT_PULLUP);

  psg.begin();
  // psg.setAddress(TheChipsAddress);   // Only need this for special-ordered chips with non-default address.

  Serial.println(F(""));
  Serial.println(F("AY-3-891x Sound Chip Library Demo: Simple tones/noise and YM file player."));
  Serial.println(F("Press button to advance to next song on SD card."));
  Serial.println(F(""));

  if (!SD.begin(CS))
  {
    Serial.println(F("SD Initialization Failed: program stopped."));
    while (1); 
  }
  else
  {
    Serial.println("SD Initialization OK");
    Serial.println("");
    root = SD.open("/");
    state = GETNEXT;
  }

  playDemoSounds();  // demo the tones and noise at startup
}

void loop()
{
  int i;
  byte register_data[14];

  switch (state) {

    case PLAYING:
      if (micros() - prev_micros > INTERVAL)
      {
        prev_micros = micros();
        if (current_song.available())
        {
          for (i = 0; i < 14; i++) {
            register_data[i] = current_song.read();
          }
          for (i = 0; i < 14; i++) {
            psg.write( i, register_data[i]);
          }
        }
        else
        {
          current_song.close();
          state = GETNEXT;
        }
      }
      if (digitalRead(NEXT_BUTTON) == LOW)
      {
        if (millis() - last_button > KEYBOUNCE_DELAY)
        {
          last_button = millis();
          state = BUTTONRELEASE;
          // Turn off audio if button is pressed
          psg.write(AY3891x::Enable_Reg, MIXER_NOISES_DISABLE | MIXER_TONES_DISABLE | psg.read(AY3891x::Enable_Reg));
        }
      }
      break;

    case BUTTONRELEASE:
      if (digitalRead(NEXT_BUTTON) == HIGH)
      {
        if (millis() - last_button > KEYBOUNCE_DELAY)
        {
          last_button = millis();
          current_song.close();
          state = GETNEXT;
        }
      }
      break;

    case GETNEXT:
      current_song = root.openNextFile();

      if (!current_song)
      {
        // No more files on the SD card
        state = NOMOREFILES;
        // When no more song files, turn off audio
        psg.write(AY3891x::Enable_Reg, MIXER_NOISES_DISABLE | MIXER_TONES_DISABLE | psg.read(AY3891x::Enable_Reg));
        Serial.println("No more files found. Press button to start again.");
      }
      else
      {
        if ( (strncmp(current_song.name(), "SYSTEM", 6) == 0) || (strncmp(current_song.name(), "TRASH", 5) == 0) )
        {
          // Windows creates a folder that is difficult to remove, so just ignore it.
          Serial.print("Skipping file: ");
          Serial.println(current_song.name());
          current_song.close();
          // state will stil be GETNEXT for next iteration through loop()
        }
        else
        {
          Serial.print("File opened: ");
          Serial.println(current_song.name());
          Serial.print("File size (bytes): ");
          Serial.println(current_song.size());
          Serial.print("Duration: ");
          Serial.print(current_song.size() / 50UL / 14UL);
          Serial.println(" seconds");
          state = PLAYING;
        }
      }
      break;

    case NOMOREFILES:
      if (digitalRead(NEXT_BUTTON) == LOW)
      {
        if (millis() - last_button > KEYBOUNCE_DELAY)
        {
          last_button = millis();
          state = BUTTONRELEASE;
          root.rewindDirectory();
        }
      }
      break;

    default:
      state = NOMOREFILES;
      break;
  }
}

void playDemoSounds() {

  Serial.println("Playing demo tones...");

  // turn off tones on all channels
  psg.write(AY3891x::Enable_Reg, (MIXER_TONE_A_DISABLE | MIXER_TONE_B_DISABLE | MIXER_TONE_C_DISABLE));

  psg.write(AY3891x::Enable_Reg, ~(MIXER_TONE_A_DISABLE));   // enable tone Ch A
  psg.write(AY3891x::ChA_Amplitude, 0x08);                   // set Ch A volume

  // play tones on Ch A
  psg.write(AY3891x::ChA_Tone_Period_Coarse_Reg, pgm_read_word(&Notes[C_3]) >> 8);
  psg.write(AY3891x::ChA_Tone_Period_Fine_Reg, pgm_read_word(&Notes[C_3]) & TONE_GENERATOR_FINE);
  delay(500);
  psg.write(AY3891x::ChA_Tone_Period_Coarse_Reg, pgm_read_word(&Notes[D_3S]) >> 8);
  psg.write(AY3891x::ChA_Tone_Period_Fine_Reg, pgm_read_word(&Notes[D_3S]) & TONE_GENERATOR_FINE);
  delay(500);

  // keep playing final tone from Ch A and add Ch B tones
  psg.write(AY3891x::Enable_Reg, ~(MIXER_TONE_A_DISABLE | MIXER_TONE_B_DISABLE));   // enable tone Ch A + B
  psg.write(AY3891x::ChB_Amplitude, 0x08);                                          // set Ch B volume

  // play tones on Ch B
  psg.write(AY3891x::ChB_Tone_Period_Coarse_Reg, pgm_read_word(&Notes[F_3S]) >> 8);
  psg.write(AY3891x::ChB_Tone_Period_Fine_Reg, pgm_read_word(&Notes[F_3S]) & TONE_GENERATOR_FINE);
  delay(500);
  psg.write(AY3891x::ChB_Tone_Period_Coarse_Reg, pgm_read_word(&Notes[A_3]) >> 8);
  psg.write(AY3891x::ChB_Tone_Period_Fine_Reg, pgm_read_word(&Notes[A_3]) & TONE_GENERATOR_FINE);
  delay(500);

  // keep playing final tone from Ch B, add Ch C tones
  psg.write(AY3891x::Enable_Reg, ~(MIXER_TONE_B_DISABLE | MIXER_TONE_C_DISABLE));   // enable tone Ch B + C
  psg.write(AY3891x::ChC_Amplitude, 0x08);                                          // set Ch C volume

  // play tones on Ch C
  psg.write(AY3891x::ChC_Tone_Period_Coarse_Reg, pgm_read_word(&Notes[C_4]) >> 8);
  psg.write(AY3891x::ChC_Tone_Period_Fine_Reg, pgm_read_word(&Notes[C_4]) & TONE_GENERATOR_FINE);
  delay(500);
  psg.write(AY3891x::ChC_Tone_Period_Coarse_Reg, pgm_read_word(&Notes[D_4S]) >> 8);
  psg.write(AY3891x::ChC_Tone_Period_Fine_Reg, pgm_read_word(&Notes[D_4S]) & TONE_GENERATOR_FINE);
  delay(1000);

  // disable tones
  psg.write(AY3891x::Enable_Reg, (MIXER_TONE_A_DISABLE | MIXER_TONE_B_DISABLE | MIXER_TONE_C_DISABLE));
  psg.write(AY3891x::ChA_Amplitude, 0x00);
  psg.write(AY3891x::ChB_Amplitude, 0x00);
  psg.write(AY3891x::ChC_Amplitude, 0x00);
  delay(250);

  // noise with envelope control
  Serial.println("Playing demo noise...");

  // lower pitched noise fade in
  psg.write(AY3891x::Enable_Reg, ~(MIXER_NOISES_DISABLE));        // enable all noise channels
  psg.write(AY3891x::Noise_Period_Reg, 0x1f);                     // configure noise pitch (lower values = higher pitch)
  psg.write(AY3891x::Env_Period_Coarse_Reg, 0x15);                // envelope time control - higher values = longer duration of effect eg slow volume fade up
  psg.write(AY3891x::Env_Shape_Cycle, ENVELOPE_CONTROL_ATTACK);   // attack envelope fades noise in

  psg.write(AY3891x::ChA_Amplitude, 0x10);                        // set noise channels to have volume controlled by envelope instead of fixed amplitudes (0x10)
  psg.write(AY3891x::ChB_Amplitude, 0x10);
  psg.write(AY3891x::ChC_Amplitude, 0x10);
  delay(1000);
  psg.write(AY3891x::Env_Period_Coarse_Reg, 0x00);                // reset envelope to shortest time period (disable effect?)
  delay(250);

  // higher pitched noise fade out
  psg.write(AY3891x::Enable_Reg, ~(MIXER_NOISES_DISABLE));        // enable all noise channels
  psg.write(AY3891x::Noise_Period_Reg, 0x05);                     // configure noise pitch (lower values = higher pitch)
  psg.write(AY3891x::Env_Period_Coarse_Reg, 0xf);                 // envelope time control - higher values = longer duration of effect eg slow volume fade up
  psg.write(AY3891x::Env_Shape_Cycle, ENVELOPE_CONTROL_HOLD);     // hold envelope fades noise out

  psg.write(AY3891x::ChA_Amplitude, 0x10);                        // set noise channels to have volume controlled by envelope instead of fixed amplitudes (0x10)
  psg.write(AY3891x::ChB_Amplitude, 0x10);
  psg.write(AY3891x::ChC_Amplitude, 0x10);
  delay(1000);
  psg.write(AY3891x::Env_Period_Coarse_Reg, 0x00);                // reset envelope to shortest time period (disable effect?)


  // high pitched tapping on metal object or 8 bit video game "walking" sound
  psg.write(AY3891x::Enable_Reg, ~(MIXER_NOISES_DISABLE));        // enable all noise channels
  psg.write(AY3891x::Noise_Period_Reg, 0x02);                     // configure noise pitch (lower values = higher pitch)
  psg.write(AY3891x::Env_Period_Coarse_Reg, 0x04);                // envelope time control - higher values = longer duration of effect eg slow volume fade up
  psg.write(AY3891x::Env_Shape_Cycle, ENVELOPE_CONTROL_CONTINUE); // continue envelope does what...repeat?

  psg.write(AY3891x::ChA_Amplitude, 0x10);                        // set noise channels to have volume controlled by envelope instead of fixed amplitudes (0x10)
  psg.write(AY3891x::ChB_Amplitude, 0x10);
  psg.write(AY3891x::ChC_Amplitude, 0x10);
  delay(1000);
  psg.write(AY3891x::Env_Period_Coarse_Reg, 0x00);                // reset envelope to shortest time period (disable effect?)


  // lower pitched noise - explosion
  psg.write(AY3891x::Enable_Reg, ~(MIXER_NOISES_DISABLE));         // enable all noise channels
  psg.write(AY3891x::Noise_Period_Reg, 0x1f);                      // configure noise pitch (lower values = higher pitch)
  psg.write(AY3891x::Env_Period_Coarse_Reg, 0x13);                 // envelope time control - higher values = longer duration of effect eg slow volume fade up
  psg.write(AY3891x::Env_Shape_Cycle, ENVELOPE_CONTROL_ALTERNATE); // alternate envelope does what...?

  psg.write(AY3891x::ChA_Amplitude, 0x10);                         // set noise channels to have volume controlled by envelope instead of fixed amplitudes (0x10)
  psg.write(AY3891x::ChB_Amplitude, 0x10);
  psg.write(AY3891x::ChC_Amplitude, 0x10);
  delay(1000);
  psg.write(AY3891x::Env_Period_Coarse_Reg, 0x00);                 // reset envelope to shortest time period (disable effect?)

  // just flat noise
  psg.write(AY3891x::Enable_Reg, ~(MIXER_NOISES_DISABLE));         // enable all noise channels
  psg.write(AY3891x::Noise_Period_Reg, 0x1a);                      // configure noise pitch (lower values = higher pitch)

  psg.write(AY3891x::ChA_Amplitude, 0x08);                         // set noise channels to have fixed volume level 0x08
  psg.write(AY3891x::ChB_Amplitude, 0x08);
  psg.write(AY3891x::ChC_Amplitude, 0x08);
  delay(1500);

  // disable noise
  psg.write(AY3891x::Enable_Reg, (MIXER_NOISES_DISABLE));

  // turn down channel volume, no more envelope control
  psg.write(AY3891x::ChA_Amplitude, 0x00);
  psg.write(AY3891x::ChB_Amplitude, 0x00);
  psg.write(AY3891x::ChC_Amplitude, 0x00);
}
