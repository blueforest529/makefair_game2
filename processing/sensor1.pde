import processing.serial.*;
import java.awt.*;
import java.awt.event.KeyEvent;

Serial myPort;

boolean temp;

void setup(){
  //ㅎ
  println(Serial.list()[0]);
  println(Serial.list()[0]);
  // 아두이노가 연결되어 있는 포트에 맞게 설정해주어야합니다. 
  // 예를들어 com6(다른 기기), com19(아두이노)가 연결 되어 있다면 2번째 포트가 아두이노이기 때문에 Serial.list[1]로 바꿔줘야 합니다.

  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
  
  myPort.bufferUntil('\n');
  
}

void draw(){
  serialEvent(myPort);
}

//키보드 이벤트를 위한 함수
void serialEvent(Serial myPort){

  String inputString = myPort.readStringUntil('\n');
  try{
    inputString = trim(inputString);
    RobotTest(inputString);
  }catch(NullPointerException ne){
    inputString = "0";
  }
}

void RobotTest(String temp) {
  try{
    Robot robot = new Robot();

     robot.setAutoDelay(10);
    if(temp.equals("s")){
      // Ctrl + S 키를 누릅니다. 
      robot.keyPress(KeyEvent.VK_SPACE);
      robot.delay(5);
      robot.keyRelease(KeyEvent.VK_SPACE);
     }
    else if(temp.equals("v")){
      // Ctrl + S 키를 누릅니다. 
      robot.keyPress(KeyEvent.VK_DOWN);
      robot.delay(5);
      robot.keyRelease(KeyEvent.VK_DOWN);
    
    }
  }catch(Exception e){
    
  }
 }
