; Amazing Innovative Students
; Shreya Shukla, Irene Hao, Anna Ast
; Intro CS1 Pd 03
; HW 36 -- Red VS. Blue Version 1.5
; 11-27-2018

breed [redTurtles redTurtle]
breed [blueTurtles blueTurtle]

; reports the number of times a patch is visited by it's own team's turtles

to-report count-visits [counter]
  if pcolor = red
  [if count redTurtles-here > 0
    [set counter counter + 1]]

  if pcolor = blue
  [if count blueTurtles-here > 0
    [set counter counter + 1]]

 report counter
end

to killer2
  if count-visits 0 > 2
  [die]
end

; clears the world and populates world with num_reds red turtles and num_blues blue turtles placed in opposing starting lines
; the turtles are evenly spaced out on white lines and face each other
to setup
  ca
  create-redTurtles num_reds
  [turtle_setup_red]

  create-blueTurtles num_blues
  [turtle_setup_blue]

  ask patches [patches_setup]
end

; setup for red turtles
to turtle_setup_red
  set size 3
  set heading 90
  set color red
  set xcor -15
  set ycor (who * (33 / num_reds) - 16 + (33 / num_reds) / 2)
end

; setup for blue turtles
to turtle_setup_blue
  set size 3
  set heading 270
  set color blue
  set xcor 15
  set ycor (who * (33 / num_blues) - 16 + (33 / num_blues) / 2)
end

; setup for patches : creates two white lines where the turtles are lined up at the beginning
to patches_setup
  if pxcor = 15 or pxcor = -15
  [set pcolor white]
end

; causes the turtles to wiggle around, creating bombs that are patches, at a rate specified by the user.
; the bombs are colored red or blue, and affect only the opposing team's players
to GO
  if color = red [run-reds]
  if color = blue [run-blues]
end

; creates red bombs at a rate (percentage) specified by the user (0% means turtles will create no bombs,
; whereas 100% means the turtles will create bombs all the time) while simultaneously making the redTurtles
; wander randomly
to run-reds
  if random 100 < RateRed
    [set pcolor red]
  locomote
end

; creates blue bombs at a rate (percentage) specified by the user while simultaneously making the blueTurtles
; wander randomly
to run-blues
  if random 100 < RateBlue
    [set pcolor blue]
  locomote
end

; kills turtles that land on the opposite team's bombs as per follows:
; a red patch is a bomb that will kill any blue turtles
; a blue patch is a bomb that will kill any red turtles
; if a patch is visited twice by it's own team's turtles, the turtle will die
to killer
  if color = red and pcolor = blue
  [set pcolor red die]
  if color = blue and pcolor = red
  [set pcolor black die]

  if count-visits 0 > 2
  [die]

end

; causes the turtles to move randomly
to locomote
  ifelse (count turtles) > 1

  [every .1
    [rt random 60
    lt random 60
    fd 0.8
      killer] ]

  [victorydance]

end

; causes the last remaining turtle to change color, change shape to a smiley face and be labelled "winner"
to victorydance
  set color random 140
  set shape "face happy"
  set label "WINNER"
  set label-color 9.9
end


; reports the number of turtles of a given color
to-report num_turtles [colour]
  report count turtles with [color = colour]
end

; reports the number of patches of a given color
to-report num_patches [colour]
  report count patches with [pcolor = colour]
end
@#$#@#$#@
GRAPHICS-WINDOW
210
10
647
448
-1
-1
13.0
1
10
1
1
1
0
1
1
1
-16
16
-16
16
0
0
1
ticks
30.0

BUTTON
106
48
172
81
NIL
setup\n
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

SLIDER
40
118
212
151
num_Reds
num_Reds
1
33
9.0
1
1
NIL
HORIZONTAL

SLIDER
41
182
213
215
num_Blues
num_Blues
1
33
11.0
1
1
NIL
HORIZONTAL

SLIDER
40
301
212
334
RateRed
RateRed
0
100
30.0
1
1
NIL
HORIZONTAL

BUTTON
109
235
172
268
NIL
GO
T
1
T
TURTLE
NIL
NIL
NIL
NIL
1

SLIDER
40
342
212
375
RateBlue
RateBlue
0
100
31.0
1
1
NIL
HORIZONTAL

MONITOR
659
15
745
60
#red_mines
num_patches red
17
1
11

MONITOR
661
78
753
123
#blue_mines
num_patches blue
17
1
11

MONITOR
663
195
755
240
#bluePlayers
num_turtles blue
17
1
11

MONITOR
664
133
750
178
#redPlayers
num_turtles red
17
1
11

BUTTON
671
325
760
358
NIL
locomote
T
1
T
TURTLE
NIL
NIL
NIL
NIL
1

@#$#@#$#@
## WHAT IS IT?

This model sets up two groups of turtles on opposite lines, facing each other. These turtles are colored either red or blue, based on the line they are on. The two groups of planes move in random directions and drop bombs at random rates depending on the slider values. Once a turtle of a certain color moves over a bomb of the opposing turtle's color, or transfers to a already visited bomb, it dies.

## HOW IT WORKS

The setup function sets up two white lines at pxcor -15 and pxcor 15. It also sets up two groups of turtles spaced evenly apart on these lines; the red group on the left, and the blue group on the right. The GO function makes the turtles move across the world. 

To run-reds and to run-blues tell the turtles to drop bombs depending on their color, and and instructs them to wiggle around using locomote. 

To locomote tells the turtles to randomly mov around every tenth of a second, while also calling to killer, which tells the turtles when to die (a red turtles dies if its lands on a blue bomb, or on a red bomb that has already been visited, and exact opposite applies to blue turtles]. 

When only one turtle is alive in the world, the function to victorydance allows the remaining turtle to become a smiley-face and be labelled "winner".

## HOW TO USE IT 

Click the setup button to create the lines and the turtles. Click the GO button to make both teams of turtles move across the world. Use the slider num_Reds to set the number of turtles on the red team, and use the slider num_Blues to set the amount of turtles on the blue team. Use the slider RateRed to set the rate at which the red turtles drop bombs, and use the slider RateBlue to set the rate at which the blue turtles drop bombs. The monitors #reds and #blues determine how many turtles are on the red and blue teams. The monitor #red_mines determines the number of red bombs in the world, and the monitor #blue_mines determines the number of blue bombs in the world.
@#$#@#$#@
default
true
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

airplane
true
0
Polygon -7500403 true true 150 0 135 15 120 60 120 105 15 165 15 195 120 180 135 240 105 270 120 285 150 270 180 285 210 270 165 240 180 180 285 195 285 165 180 105 180 60 165 15

arrow
true
0
Polygon -7500403 true true 150 0 0 150 105 150 105 293 195 293 195 150 300 150

box
false
0
Polygon -7500403 true true 150 285 285 225 285 75 150 135
Polygon -7500403 true true 150 135 15 75 150 15 285 75
Polygon -7500403 true true 15 75 15 225 150 285 150 135
Line -16777216 false 150 285 150 135
Line -16777216 false 150 135 15 75
Line -16777216 false 150 135 285 75

bug
true
0
Circle -7500403 true true 96 182 108
Circle -7500403 true true 110 127 80
Circle -7500403 true true 110 75 80
Line -7500403 true 150 100 80 30
Line -7500403 true 150 100 220 30

butterfly
true
0
Polygon -7500403 true true 150 165 209 199 225 225 225 255 195 270 165 255 150 240
Polygon -7500403 true true 150 165 89 198 75 225 75 255 105 270 135 255 150 240
Polygon -7500403 true true 139 148 100 105 55 90 25 90 10 105 10 135 25 180 40 195 85 194 139 163
Polygon -7500403 true true 162 150 200 105 245 90 275 90 290 105 290 135 275 180 260 195 215 195 162 165
Polygon -16777216 true false 150 255 135 225 120 150 135 120 150 105 165 120 180 150 165 225
Circle -16777216 true false 135 90 30
Line -16777216 false 150 105 195 60
Line -16777216 false 150 105 105 60

car
false
0
Polygon -7500403 true true 300 180 279 164 261 144 240 135 226 132 213 106 203 84 185 63 159 50 135 50 75 60 0 150 0 165 0 225 300 225 300 180
Circle -16777216 true false 180 180 90
Circle -16777216 true false 30 180 90
Polygon -16777216 true false 162 80 132 78 134 135 209 135 194 105 189 96 180 89
Circle -7500403 true true 47 195 58
Circle -7500403 true true 195 195 58

circle
false
0
Circle -7500403 true true 0 0 300

circle 2
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240

cow
false
0
Polygon -7500403 true true 200 193 197 249 179 249 177 196 166 187 140 189 93 191 78 179 72 211 49 209 48 181 37 149 25 120 25 89 45 72 103 84 179 75 198 76 252 64 272 81 293 103 285 121 255 121 242 118 224 167
Polygon -7500403 true true 73 210 86 251 62 249 48 208
Polygon -7500403 true true 25 114 16 195 9 204 23 213 25 200 39 123

cylinder
false
0
Circle -7500403 true true 0 0 300

dot
false
0
Circle -7500403 true true 90 90 120

face happy
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 255 90 239 62 213 47 191 67 179 90 203 109 218 150 225 192 218 210 203 227 181 251 194 236 217 212 240

face neutral
false
0
Circle -7500403 true true 8 7 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Rectangle -16777216 true false 60 195 240 225

face sad
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 168 90 184 62 210 47 232 67 244 90 220 109 205 150 198 192 205 210 220 227 242 251 229 236 206 212 183

fish
false
0
Polygon -1 true false 44 131 21 87 15 86 0 120 15 150 0 180 13 214 20 212 45 166
Polygon -1 true false 135 195 119 235 95 218 76 210 46 204 60 165
Polygon -1 true false 75 45 83 77 71 103 86 114 166 78 135 60
Polygon -7500403 true true 30 136 151 77 226 81 280 119 292 146 292 160 287 170 270 195 195 210 151 212 30 166
Circle -16777216 true false 215 106 30

flag
false
0
Rectangle -7500403 true true 60 15 75 300
Polygon -7500403 true true 90 150 270 90 90 30
Line -7500403 true 75 135 90 135
Line -7500403 true 75 45 90 45

flower
false
0
Polygon -10899396 true false 135 120 165 165 180 210 180 240 150 300 165 300 195 240 195 195 165 135
Circle -7500403 true true 85 132 38
Circle -7500403 true true 130 147 38
Circle -7500403 true true 192 85 38
Circle -7500403 true true 85 40 38
Circle -7500403 true true 177 40 38
Circle -7500403 true true 177 132 38
Circle -7500403 true true 70 85 38
Circle -7500403 true true 130 25 38
Circle -7500403 true true 96 51 108
Circle -16777216 true false 113 68 74
Polygon -10899396 true false 189 233 219 188 249 173 279 188 234 218
Polygon -10899396 true false 180 255 150 210 105 210 75 240 135 240

house
false
0
Rectangle -7500403 true true 45 120 255 285
Rectangle -16777216 true false 120 210 180 285
Polygon -7500403 true true 15 120 150 15 285 120
Line -16777216 false 30 120 270 120

leaf
false
0
Polygon -7500403 true true 150 210 135 195 120 210 60 210 30 195 60 180 60 165 15 135 30 120 15 105 40 104 45 90 60 90 90 105 105 120 120 120 105 60 120 60 135 30 150 15 165 30 180 60 195 60 180 120 195 120 210 105 240 90 255 90 263 104 285 105 270 120 285 135 240 165 240 180 270 195 240 210 180 210 165 195
Polygon -7500403 true true 135 195 135 240 120 255 105 255 105 285 135 285 165 240 165 195

left airplane
true
0
Polygon -7500403 true true 0 150 15 165 60 180 105 180 165 285 195 285 180 180 240 165 270 195 285 180 270 150 285 120 270 90 240 135 180 120 195 15 165 15 105 120 60 120 15 135

line
true
0
Line -7500403 true 150 0 150 300

line half
true
0
Line -7500403 true 150 0 150 150

pentagon
false
0
Polygon -7500403 true true 150 15 15 120 60 285 240 285 285 120

person
false
0
Circle -7500403 true true 110 5 80
Polygon -7500403 true true 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Rectangle -7500403 true true 127 79 172 94
Polygon -7500403 true true 195 90 240 150 225 180 165 105
Polygon -7500403 true true 105 90 60 150 75 180 135 105

plant
false
0
Rectangle -7500403 true true 135 90 165 300
Polygon -7500403 true true 135 255 90 210 45 195 75 255 135 285
Polygon -7500403 true true 165 255 210 210 255 195 225 255 165 285
Polygon -7500403 true true 135 180 90 135 45 120 75 180 135 210
Polygon -7500403 true true 165 180 165 210 225 180 255 120 210 135
Polygon -7500403 true true 135 105 90 60 45 45 75 105 135 135
Polygon -7500403 true true 165 105 165 135 225 105 255 45 210 60
Polygon -7500403 true true 135 90 120 45 150 15 180 45 165 90

right airplane
true
0
Polygon -7500403 true true 300 150 285 135 240 120 195 120 135 15 105 15 120 120 60 135 30 105 15 120 30 150 15 180 30 210 60 165 120 180 105 285 135 285 195 180 240 180 285 165

sheep
false
15
Circle -1 true true 203 65 88
Circle -1 true true 70 65 162
Circle -1 true true 150 105 120
Polygon -7500403 true false 218 120 240 165 255 165 278 120
Circle -7500403 true false 214 72 67
Rectangle -1 true true 164 223 179 298
Polygon -1 true true 45 285 30 285 30 240 15 195 45 210
Circle -1 true true 3 83 150
Rectangle -1 true true 65 221 80 296
Polygon -1 true true 195 285 210 285 210 240 240 210 195 210
Polygon -7500403 true false 276 85 285 105 302 99 294 83
Polygon -7500403 true false 219 85 210 105 193 99 201 83

square
false
0
Rectangle -7500403 true true 30 30 270 270

square 2
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240

star
false
0
Polygon -7500403 true true 151 1 185 108 298 108 207 175 242 282 151 216 59 282 94 175 3 108 116 108

target
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240
Circle -7500403 true true 60 60 180
Circle -16777216 true false 90 90 120
Circle -7500403 true true 120 120 60

tree
false
0
Circle -7500403 true true 118 3 94
Rectangle -6459832 true false 120 195 180 300
Circle -7500403 true true 65 21 108
Circle -7500403 true true 116 41 127
Circle -7500403 true true 45 90 120
Circle -7500403 true true 104 74 152

triangle
false
0
Polygon -7500403 true true 150 30 15 255 285 255

triangle 2
false
0
Polygon -7500403 true true 150 30 15 255 285 255
Polygon -16777216 true false 151 99 225 223 75 224

truck
false
0
Rectangle -7500403 true true 4 45 195 187
Polygon -7500403 true true 296 193 296 150 259 134 244 104 208 104 207 194
Rectangle -1 true false 195 60 195 105
Polygon -16777216 true false 238 112 252 141 219 141 218 112
Circle -16777216 true false 234 174 42
Rectangle -7500403 true true 181 185 214 194
Circle -16777216 true false 144 174 42
Circle -16777216 true false 24 174 42
Circle -7500403 false true 24 174 42
Circle -7500403 false true 144 174 42
Circle -7500403 false true 234 174 42

turtle
true
0
Polygon -10899396 true false 215 204 240 233 246 254 228 266 215 252 193 210
Polygon -10899396 true false 195 90 225 75 245 75 260 89 269 108 261 124 240 105 225 105 210 105
Polygon -10899396 true false 105 90 75 75 55 75 40 89 31 108 39 124 60 105 75 105 90 105
Polygon -10899396 true false 132 85 134 64 107 51 108 17 150 2 192 18 192 52 169 65 172 87
Polygon -10899396 true false 85 204 60 233 54 254 72 266 85 252 107 210
Polygon -7500403 true true 119 75 179 75 209 101 224 135 220 225 175 261 128 261 81 224 74 135 88 99

wheel
false
0
Circle -7500403 true true 3 3 294
Circle -16777216 true false 30 30 240
Line -7500403 true 150 285 150 15
Line -7500403 true 15 150 285 150
Circle -7500403 true true 120 120 60
Line -7500403 true 216 40 79 269
Line -7500403 true 40 84 269 221
Line -7500403 true 40 216 269 79
Line -7500403 true 84 40 221 269

wolf
false
0
Polygon -16777216 true false 253 133 245 131 245 133
Polygon -7500403 true true 2 194 13 197 30 191 38 193 38 205 20 226 20 257 27 265 38 266 40 260 31 253 31 230 60 206 68 198 75 209 66 228 65 243 82 261 84 268 100 267 103 261 77 239 79 231 100 207 98 196 119 201 143 202 160 195 166 210 172 213 173 238 167 251 160 248 154 265 169 264 178 247 186 240 198 260 200 271 217 271 219 262 207 258 195 230 192 198 210 184 227 164 242 144 259 145 284 151 277 141 293 140 299 134 297 127 273 119 270 105
Polygon -7500403 true true -1 195 14 180 36 166 40 153 53 140 82 131 134 133 159 126 188 115 227 108 236 102 238 98 268 86 269 92 281 87 269 103 269 113

x
false
0
Polygon -7500403 true true 270 75 225 30 30 225 75 270
Polygon -7500403 true true 30 75 75 30 270 225 225 270
@#$#@#$#@
NetLogo 6.0.4
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
default
0.0
-0.2 0 0.0 1.0
0.0 1 1.0 0.0
0.2 0 0.0 1.0
link direction
true
0
Line -7500403 true 150 150 90 180
Line -7500403 true 150 150 210 180
@#$#@#$#@
0
@#$#@#$#@
