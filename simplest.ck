//******************************************************************
// Bonnie Eisenman (bmeisenm@)
// Harvest Zhang (hlzhang@)
// 9 March 2014
// 
// Demonstration of bare minimum necessary to interface w/ Touche.
//
// Run as: chuck simplest.ck: [serialport]
// If you don't know the serial port number, run as chuck simplest.ck
// and select the correct USB port number.
//******************************************************************

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

// Set up the music generators
SinOsc osc => Gain g => dac;
g.gain(0.8);

while(true)
{
    cereal.onInts(2) => now;
    cereal.getInts() @=> int ints[];



    if(ints$Object != null) {

    for(int i; i < ints.cap(); i++) {
        chout <= ints[i] <= " ";
        }
    
    chout <= IO.newline();


        (ints[0]) => int pos;

        (ints[1]) => int val;
        osc.freq(Std.mtof(pos)); // Change sin wave frequency
    }
//    200::ms => now;
}
