0 REM POKE 49234,0 : REM full-screen graphics
0 REM POKE 49235,0 : REM mixed mode
0 REM color 1 is red, color 6 is blue

 985 rem GET_KEY
 990 rem input key-press, output (dx, dy) +/- 1
 995 rem if a non-arrow-key is pressed, output (0, 0)
1000 let dx = 0
1010 let dy = 0
1020 get d$
1030 let c = asc(d$)
1040 if c = 11 then dy = -1 : rem up (y-axis grows down)
1050 if c = 10 then dy = 1 : rem down
1060 if c = 8 then dx = -1 : rem left
1070 if c = 21 then dx = 1 : rem right
1080 return

10 gosub 2000
20 end

2000 HOME : GR
2010 color = 1
2020 x = 20
2030 y = 10
2040 plot X,Y*2
2050 plot X,Y*2+1
2060 gosub 1000
2070 x = x + dx
2080 y = y + dy
2090 goto 2040
2100 return : rem unreachable




10010 REM draw a red square in the center of the screen
10020 HOME : GR
10030 COLOR=1
10033 X = 20
10036 Y = 12
10040 PLOT X,Y*2
10050 PLOT X,Y*2+1

63000 rem test GET_KEY
63010 HOME : TEXT
63020 gosub 1000
63030 print dx,dy
63040 goto 20
