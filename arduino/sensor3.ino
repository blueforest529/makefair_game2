#define LED_PIN1 4
#define LED_PIN2 5

double jump_value;
double down_value;

bool jump_flag = false;
bool down_flag = false;

void setup()
{
  Serial.begin(9600);
}
void loop()
{
  jump_value = analogRead(A0);
  down_value = analogRead(A1);
  

  if(jump_value>=650){//점프함
        if(!jump_flag){
          Bang();
          delay(500);
        }
        jump_flag = true;
        digitalWrite(LED_PIN1, LOW);
  }else{
        jump_flag = false;
        digitalWrite(LED_PIN1, HIGH);
  }

  if(down_value>=120){//숙임
        if(!down_flag){
          Bang2();
          delay(500);
        }
        down_flag = true;
        digitalWrite(LED_PIN2, LOW);
  }else{
         down_flag = false;
         digitalWrite(LED_PIN2, HIGH);
  }

}
void Bang() {
  //static unsigned long lastDebounceTime = 0;
 // unsigned long debounceTime = millis();

 // if(debounceTime - lastDebounceTime > 400) {
    //buttonStatus = !buttonStatus;
    Serial.write("s");
    Serial.write("\n");
  //} 
 // lastDebounceTime = debounceTime;
}

void Bang2() {
  //static unsigned long lastDebounceTime = 0;
 // unsigned long debounceTime = millis();

 // if(debounceTime - lastDebounceTime > 400) {
    //buttonStatus = !buttonStatus;
    Serial.write("v");
    Serial.write("\n");
  //} 
 // lastDebounceTime = debounceTime;
}
