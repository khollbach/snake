0 REM POKE 49234,0 : REM full-screen graphics
0 REM POKE 49235,0 : REM mixed mode
0 REM color 1 is red, color 6 is blue

10 REM draw a red square in the center of the screen
20 HOME : GR
30 COLOR=1
33 X = 20
36 Y = 12
40 PLOT X,Y*2
50 PLOT X,Y*2+1
