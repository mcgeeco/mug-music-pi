SerialIO.list() @=> string list[];

for(int i; i < list.cap(); i++)
{
    chout <= i <= ": " <= list[i] <= IO.newline();
}

// parse first argument as device number - on Pi this is always 0
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

    for(int i; i < ints.cap(); i++) {
        chout <= ints[i] <= " ";
        }
	chout <= IO.newline();

        ints[0] => int val;
        ints[1] => int pos;
        muggy.play(val, pos);
        
    }
}


class Mug {
    
    SinOsc c;
    ADSR env;
    PRCRev reverb;
    Gain g;
    Pan2 p;
    
    c => env => reverb => g => p => dac;
    g.gain(0.35);               //higher gains may result in distortion!
    1 => p.pan;     // panning left or right
    env.set(10::ms, 200::ms, 0.5, 100::ms);
    0 => int lastVal;
    
    fun void play(int val, int pos) {
        // Loitering reading - this value will depend on your setup, and may creep incrementally over time
        if (val < 28) {
            env.keyOff();
        }
        else if (val != lastVal) {
                env.keyOff();
                10::ms => now;
                env.keyOn();
            }
        
        if (pos < 270) {   //I increased the overall pitch for artistic reasons. May not be necessary for you
		val + 20 => val;
	}

        c.freq(Std.mtof(val+40));
        val => lastVal;
       } 
}
