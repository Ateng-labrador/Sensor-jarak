// sensor HC
int TRIG_PIN = 8;
int ECHO_PIN = 9;

// LED
int LED_1 = 13;
int LED_2 = 12;
int LED_3 = 4;

// BUZZER
int BUZZER_1 = 6;
int BUZZER_2 = 7;

long duration;
float distance;

void setup() {
  Serial.begin(600);
  // SENSOR
  pinMode(TRIG_PIN, OUTPUT);
  pinMode(ECHO_PIN, INPUT);

  // LED
  pinMode(LED_1, OUTPUT);
  pinMode(LED_2, OUTPUT);
  pinMode(LED_3, OUTPUT);

  // BUZZER
  pinMode(BUZZER_1, OUTPUT);
}

void loop() {
  digitalWrite(TRIG_PIN, LOW);
  delayMicroseconds(2);
  digitalWrite(TRIG_PIN, HIGH);
  delayMicroseconds(10);
  digitalWrite(TRIG_PIN, LOW);

  // Mengukur waktu
  duration = pulseIn(ECHO_PIN, HIGH);
  distance = (duration * 0.0343) / 2;

  
  digitalWrite(LED_1, LOW);
  digitalWrite(LED_2, LOW);
  digitalWrite(LED_3, LOW);

  digitalWrite(BUZZER_1, LOW);
  digitalWrite(BUZZER_2, LOW);
  if(distance >= 160){
    digitalWrite(LED_3, HIGH);
    
  }
  else if(distance >= 50 && distance < 160){
    digitalWrite(LED_2, HIGH);
    digitalWrite(BUZZER_1, LOW);
    delay(500);
    digitalWrite(BUZZER_1, HIGH);
    delay(500);
  }
  else{
    digitalWrite(LED_1, HIGH);
    digitalWrite(BUZZER_1, LOW);    
    digitalWrite(BUZZER_2, LOW);    

    delay(100);
    
    digitalWrite(BUZZER_1, HIGH);
    digitalWrite(BUZZER_2, HIGH);
    delay(100);
  }

  Serial.print("Distance: ");
  Serial.print(distance);
  Serial.println(" cm");

}
