SerialIO.list() @=> string list[];

for(int i; i < list.cap(); i++)
{
    chout <= i <= ": " <= list[i] <= IO.newline();
}

// parse first argument as device number
0 => int device;
if(me.args()) {
    me.arg(0) => Std.atoi => device;
}

if(device >= list.cap())
{
    cherr <= "serial device #" <= device <= " not available\n";
    me.exit(); 
}

SerialIO cereal;
if(!cereal.open(device, SerialIO.B9600, SerialIO.ASCII))
{
	chout <= "unable to open serial device '" <= list[device] <= "'\n";
	me.exit();
}


Mug muggy;

while(true)
{
    cereal.onInts(2) => now;
    cereal.getInts() @=> int ints[];
    if(ints$Object != null) {

//    for(int i; i < ints.cap(); i++) {
  //      chout <= ints[i] <= " ";
    //    }

        ints[0] => int pos;
        ints[1] => int val;
        muggy.play(pos);
      	chout <= ints[0] <= " " <=  ints[1];
 	 }
}


class Mug {
    
    SinOsc c;
    ADSR env;
    PRCRev reverb;
    Gain g;
    
    c => env => reverb => g => dac;
    g.gain(0.5);
    env.set(10::ms, 200::ms, 0.5, 100::ms);
    0 => int lastVal;
    
    fun void play(int val) {
        // Loitering reading
        if (val < 35) {
            env.keyOff();
        }
        else if (val != lastVal) {
                env.keyOff();
//                10::ms => now;
                env.keyOn();
            }
        
        c.freq(Std.mtof(val));
        val => lastVal;
        chout <= val <= IO.newline();
        
    }
}
