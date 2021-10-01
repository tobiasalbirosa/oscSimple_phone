import oscP5.*;
import netP5.*;
import controlP5.*;
OscP5 oscP5;
NetAddress ipRemoto;
ControlP5 cp5;
float m1, m2, m3, m4;
String m, canalOut, currentHost;
int cantidadDeCanales = 4;
String canalIn0, canalIn1, canalIn2, canalIn3;
int saturacion0, saturacion1, saturacion2, saturacion3;
boolean RECEIVE0, RECEIVE1, RECEIVE2, RECEIVE3;
boolean SEND0, SEND1, SEND2, SEND3;
Chart grafico0, grafico1, grafico2, grafico3;
Chart graficoOut0, graficoOut1, graficoOut2, graficoOut3;
Router router;
public void settings() {
  size(displayWidth/3, displayHeight/2);
}
public void setup() {  
  background(0);
  cp5 = new ControlP5(this);
  frameRate(12);
  try {
    println(java.net.InetAddress.getLocalHost().getHostAddress());
    currentHost = java.net.InetAddress.getLocalHost().getHostAddress();
  } 
  catch(Exception e) {
    currentHost = "0.0.0.0";
  }
  oscP5 = new OscP5(this, 12000);
  ipRemoto = new NetAddress("localhost", 6000);
  canalOut = "/message";
  surface.setResizable(true);
  router = new Router(cantidadDeCanales);
}
void draw() {
  router.actualizar();
}
