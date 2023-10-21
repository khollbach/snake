0 rem poke 49234,0 : rem' full-screen graphics
0 rem poke 49235,0 : rem' mixed mode


1 gosub 1000 : rem call main()
2 end


0 rem 1000 main()
1000 home : gr
1010 let x1 = 13
1020 let y1 = 10
1030 let x2 = 26
1040 let y2 = 10

0 rem' draw snake heads
1050 color = 1 : rem loop draw
1060 plot x1,y1*2
1070 plot x1,y1*2+1
1080 color = 6
1090 plot x2,y2*2
1100 plot x2,y2*2+1

0 rem' get input; possibly update a player's position
1120 get key$
1130 let a = asc(key$)
1140 gosub 2000 : rem call p1_key_dir()
1150 x1 = x1 + dx
1160 y1 = y1 + dy
1170 gosub 3000 : rem call p2_key_dir()
1180 x2 = x2 + dx
1190 y2 = y2 + dy

1200 goto 1050 : rem loop end draw
1210 return : rem' unreachable


0 rem 2000 p1_key_dir(a: keycode) -> (dx, dy)
0 rem' p1 keys are WASD
0 rem' if `a` is not a p1 key, output (0, 0)
2000 let dx = 0
2010 let dy = 0
2040 if a = 87 then dy = -1 : rem up (y-axis grows down)
2050 if a = 83 then dy = 1 : rem down
2060 if a = 65 then dx = -1 : rem left
2070 if a = 68 then dx = 1 : rem right
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
