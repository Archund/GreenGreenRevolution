
#define BUTTON 8
#define OUT A3
#define LIGHT A0
#define IR 4
#define sensitivity 1.6

int button;
int brake;
int light;
int lightInit;
int resInit;
float res;

bool bdrop = false;
bool ldrop = false;
bool idrop = false;





void sweetch(int type) {
    tone(OUT, 54+4*type, 1000/8);
    delay(500);
}



void setup() {

    while(!Serial);

    pinMode(BUTTON, INPUT); //set button as an INPUT device
    pinMode(LIGHT, INPUT);
    pinMode(IR, INPUT);
    pinMode(OUT, OUTPUT); //set output


    lightInit = analogRead(LIGHT);
    resInit = (float)(1023-lightInit)*10/lightInit;


    Serial.begin(9600);  // initialize serial communication
      // Adds newline to every command


    Serial.println("Starting bridge...\n");


}


void loop() {



    button = digitalRead(BUTTON); //read the status of the button
    light = analogRead(LIGHT);
    res = (float)(1023-light)*10/light;
    brake = digitalRead(IR);


    if (button && !bdrop) {
        bdrop = true;
        //tone(OUT, 65, 1000 / 12);
    }
    else if (!button && bdrop) {
        bdrop = false;
        sweetch(1);
    }

    else if(res>resInit*sensitivity && !ldrop) {
        ldrop = true;
    }
    else if(res<=resInit*sensitivity && ldrop) {
        ldrop = false;
        sweetch(2);
    }

    else if(brake && !idrop) {
        idrop = true;
    }
    else if(!brake && idrop) {
        idrop = false;
        //sweetch(3);
    }




    


    Serial.print(button);
    Serial.print(" - ");
    Serial.print(res);
    Serial.print(" - ");
    Serial.print(brake);
    Serial.print("\n");


}