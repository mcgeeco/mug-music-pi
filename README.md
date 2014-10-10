# Mug Music Pi

This fork is a stripped down version of Mug Music by Bonnie Eisenman and Harvest Zhang, which I adapted for use on Raspberry Pi.

## How to Use

I'll fill in as much as I can [here](http://conormcgee.com/projects/mug-music-pi/). Unfortunately I didn't keep proper notes as I was getting it all to work, so I can't recall the whole process. There were definitely a couple of dependencies, including the ALSA library and libsndfile.
Unfortunately the audio ended up being quite distorted at higher gains, so I had to keep the gain setting within the ChucK programme very low. The distortion was slightly lower on the Model B+ compared to the Model B. Having an ethernet cable or, especially, a wifi adapter produced a lot more distortion. It's possible, from my research, that using an external sound-card could fix this, but I didn't have one on hand.

## TODO

The serial connection between the Arduino and ChucK programme is quite buggy as there was no Fermata to handle that. As such, often the programme will fail to work properly when started up. My lazy solution was to just keep starting it again until the correct values were being read - never took more than a couple attempts. I imagine that with better error-handling and understanding of serial communication this wouldn't be that hard to fix, which would mean the programme could run on start-up, which would be a lot more convenient. However, once I got the programme running correctly, I never had any problems, even after 5-6 hours. One slight issue is that the resting values seemed to creep up by one or two over the course of the day, requiring slight recalibration.'

## Credits

Code adapted from:
- madlabdk's touche_peak file is reproduced here without significant modifications: https://github.com/madlabdk/touche
- Mostly based on instructions here: www.instructables.com/id/Touche-for-Arduino-Advanced-touch-sensing/?ALLSTEPS
- Original Touché paper: http://www.disneyresearch.com/wp-content/uploads/touchechi2012.pdf
- ChucK is a project from Princeton University.
- The origin project from which this was forked.

