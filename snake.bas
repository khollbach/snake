0 rem poke 49234,0 : rem' full-screen graphics
0 rem poke 49235,0 : rem' mixed mode


1 gosub 1000 : rem call main()
2 end


0 rem 1000 main()
1000 home : gr

0 rem' initial positions and directions
1010 let x1=13 : y1=10 : d1=1 : e1=0
1030 let x2=26 : y2=10 : d2=-1 : e2=0

0 rem' draw snake heads
1050 color = 1 : rem loop draw
1060 plot x1,y1*2
1070 plot x1,y1*2+1
1080 color = 6
1090 plot x2,y2*2
1100 plot x2,y2*2+1

0 rem' get input in a loop, waiting for the next 'frame'
1110 for t = 1 to 100
1120 let a = 0
1130 if peek(49152) >= 128 then get key$ : a = asc(key$) : ? a
0 rem' note that we always run the loop body, even if no key was pressed.
0 rem' this is so that each tick takes a similar amount of time.
1140 gosub 2000 : rem call p1_key_dir()
0 rem' todo guard this direction change to not go backwards
0 rem' (need another set of vars)
1150 if not(dx=0 and dy=0) then d1 = dx : e1 = dy
1160 gosub 3000 : rem call p2_key_dir()
1170 if not(dx=0 and dy=0) then d2 = dx : e2 = dy
1180 next t

0 rem' update positions
1190 x1 = x1 + d1
1200 y1 = y1 + e1
1210 x2 = x2 + d2
1220 y2 = y2 + e2

1230 goto 1050 : rem loop end draw
1240 return : rem' unreachable


0 rem 2000 p1_key_dir(a: keycode) -> (dx, dy)
0 rem' p1 keys are WASD
0 rem' if `a` is not a p1 key, output (0, 0)
2000 let dx = 0
2010 let dy = 0
2040 if a=87 or a=119 then dy = -1 : rem up (y-axis grows down)
2050 if a=83 or a=115 then dy = 1 : rem down
2060 if a=65 or a=97 then dx = -1 : rem left
2070 if a=68 or a=100 then dx = 1 : rem right
2080 return


0 rem 3000 p2_key_dir(a: keycode) -> (dx, dy)
0 rem' p2 keys are arrow keys, for now
0 rem' if `a` is not a p2 key, output (0, 0)
3000 let dx = 0
3010 let dy = 0
3040 if a = 11 then dy = -1
3050 if a = 10 then dy = 1
3060 if a = 8 then dx = -1
3070 if a = 21 then dx = 1
3080 return
