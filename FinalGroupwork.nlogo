; MaoShukla
; Madelyn Mao Shreya Shukla
; IntroCs1 P3
; Lab Work 2 (CA Lab Work)
; 12/6/2018

patches-own [living_neighbors]

; go calls and repeats a cellular automation based on what the user chooses

to GO
  if configuration = "Persian Rug" [persian-rug]
  if configuration = "Conway's Game of Life" [GameOfLife]
  if configuration = "Floral-design" [floral-design]
end

; PART 1 - PERSIAN RUG

; returns the number of alive neighbors for any given patch
to-report num-neighbors
  report count neighbors with [pcolor = 9]
end


; sets up patches in a cool way that allows the Persian Rug to expand and create intricate patterns
to coolSetup
  ca
  ask patches [if pxcor = 0 and pycor = 0 [set pcolor white]]
  ask patches [if pxcor = 1 and pycor = 1 [set pcolor white]]
  ask patches [if pxcor = -1 and pycor = -1 [set pcolor white]]
  ask patches [if pxcor = -1 and pycor = 1 [set pcolor white]]
  ask patches [if pxcor = 1 and pycor = -1 [set pcolor white]]
end

; creates a automation where the patches multiply and transition between live and dead states, creating the pattern
; of a persian rug. The following rules apply:
; A patch is white when it is alive. It becomes a shade paler when it is multiplying.
; In each tick of the game, a previously alive white cell dies.
; A dead patch is colored black, and can only be revived if it has 2, 3 or 4 alive neighbors.

to persian-rug
  every .3 [
  condition1
  condition2
  condition3
  condition4
  condition5
  ]
end

; white cells are changed into a paler shade when they are multiplying
to condition1
  ask patches with [pcolor = white] [set pcolor 9]
end

; dead patches with 2 live neighbors are revived
to condition2
  ask patches with [pcolor = black and num-neighbors = 2] [set pcolor white]
end

; dead patches with 3 live neighbors are revived
to condition3
  ask patches with [pcolor = black and num-neighbors = 3] [set pcolor white]
end

; dead patches with 4 live neighbors are revived
to condition4
  ask patches with [pcolor = black and num-neighbors = 4] [set pcolor white]
end

; all previously alive patches die, meaning they change color from a shade of white to black
to condition5
  ask patches with [pcolor = 9] [set pcolor black]
end


; PART 2 - CONWAYS GAME OF LIFE

; sets patches alive randomly based on a user-specified percentage
to sprinkle
  ask patches [
    if (random 100 <= initialDensity) [set pcolor white]
  ]
end

; clears the world and sets random white patches randomly
to setup
  ca
  sprinkle
end


; creates a cellular automation where
to GameOfLife
  every .3 [
  rule1
  rule2
  rule3
  rule4
  ]
end

; white patches change color into a shade of white in which they are multiplying
to rule1
  ask patches with [pcolor = white] [set pcolor 9]
end

; black patches are dead but become revived if they have 3 live neighbors
to rule2
  ask patches with [pcolor = black and num-neighbors = 3] [set pcolor 9]
end

; causes white patches to die from overpopulation or loneliness (patches with less than two
; neighbors or more than 3 neighbors will die]
to rule3
  ask patches with [pcolor = 9 and num-neighbors < 2] [set pcolor black]
  ask patches with [pcolor = 9 and num-neighbors > 3] [set pcolor black]
end

; the transforming and patches with exactly 3 neighbors are now alive
to rule4
  ask patches with [pcolor = 9] [set pcolor white]
end

; PART 3 OUR CELLULAR AUTOMATION

; basically the same as the persian rug setup, except this has color
to FLORALsetup
  ca
  ask patches [set pcolor 14]
  ask patches [if pxcor = 0 and pycor = 0 [set pcolor 28]]
  ask patches [if pxcor = 1 and pycor = 1 [set pcolor 28]]
  ask patches [if pxcor = -1 and pycor = -1 [set pcolor 28]]
  ask patches [if pxcor = -1 and pycor = 1 [set pcolor 28]]
  ask patches [if pxcor = 1 and pycor = -1 [set pcolor 28]]
end

; creates a floral design using the cellular automation
to floral-design
  every .3 [
  edict1
  edict2
  edict3
  edict4
  edict5
  ]
end

; counts the number of live neighbors
to-report live-neighbors
  report count neighbors with [pcolor = white]
end

; white cells are changed into a different shade
to edict1
  ask patches with [pcolor = 28] [set pcolor white]
end
; dead patches with 2 neighbors are turned alive
to edict2
  ask patches with [pcolor = 14 and live-neighbors = 1] [set pcolor 28]
end
; dead patches with 3 neighbors are turned alive
to edict3
  ask patches with [pcolor = 14 and live-neighbors = 4] [set pcolor 28]
end
; dead patches with 4 neighbors are turned alive
to edict4
  ask patches with [pcolor = 14 and live-neighbors = 7] [set pcolor 28]
end
; the different shaded patch colors die
to edict5
  ask patches with [pcolor = white] [set pcolor 14]
end

; PART 4 USER INTERACTIONS

; allows the user to draw white patches
to DRAW
  if mouse-down? [ ask patch mouse-xcor mouse-ycor
    [set pcolor white] ]
end

; allows the user to erase white patches
to ERASE
  if mouse-down? [ask patch mouse-xcor mouse-ycor
    [set pcolor black]]
end

; enables the user to color or erase patches
to art
  if userconfiguration = "Draw" [DRAW]
  if userconfiguration = "Erase" [ERASE]
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
5
143
106
176
setup
setup
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
18
101
190
134
initialDensity
initialDensity
0
100
29.0
1
1
NIL
HORIZONTAL

CHOOSER
19
194
206
239
configuration
configuration
"Persian Rug" "Conway's Game of Life" "Floral-design"
2

TEXTBOX
33
24
183
104
White patches are alive ...\nBlack patches are dead ...
14
125.0
1

BUTTON
24
309
87
342
GO
GO
T
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

CHOOSER
25
363
164
408
userConfiguration
userConfiguration
"Draw" "Erase"
0

BUTTON
107
309
170
342
ART
art
T
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
17
251
203
284
coolSetup(RugConfig)
coolSetup
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
56
413
119
446
clear
ca
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
109
143
204
176
NIL
FLORALsetup
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

@#$#@#$#@
## WHAT IS IT?
Persian Rug uses cellular automation to mimic the intricate designs of a persian rug. The algorithim makes the patches interact with each other in a repeating rug-like pattern according to the following rules - patches with 2, 3, or 4 live neighbors are brought to life, and patches that are currently alive die. 

The Game of Life is a cellular automaton devised by British mathematician John Conway. It consists of a collection of cells which, based on a few mathematical rules, can live, die or multiply. The evolution of the cells is determined by its initial cell configuration, and the game requires no further input.					 	

In our floral design function, the cellular automation B147/S creates a aesthetic design of blocks and boxes. Patches with 1, 3, or 7 live neighbors are born and currently alive patches with are instantaneously killed. The process repeats continously, meaning a patch becomes alive, then dead, then alive, and so forth. 

## HOW IT WORKS
For all our functions, we used 3 colors- one for alive patches, one transitional color (which was usually a different shade of the alive color) for multiplying patches, and a color for dead patches.

We set the patches that are originally alive to a distinct shade of that color. Next, we revived dead patches that meet the neighbor requirements (For example, in Persian Rug, any patches with 2, 3 or 4 live neighbors were revived). These patches were set to the alive color, while all the transitional shade color cells were set to the dead patches color.

For persian rug, the rule we followed was B234/S (kill all live cells and revive cells with 2,3 or 4 live neighbors). Our code for Game Of Life was a bit more aberrant- B3/S23 (cells with 2 live neighbors survive, while the dead cells with 2 or 3 live neighbors are revived).

We modified these ideas slightly to incorportate color in our floral design function. We changed the characteristics neighbors have to simply red and yellow patches instead of black and white ones. We also followed a different automation rule : B147/S (kill all alive cells in each tick, while reviving dead patches with 1, 4 or 7 live neighbors).

## HOW TO USE IT

To test out the persian rug function, first select "Persian Rug" in the drop-down menu labelled configuration. Next, click on the coolSetup(RugConfig) button for a initial rug pattern. Finally, click on the “GO” button, and watch the magic unfold!

To test out Conway’s Game of Life, select Conway's Game of Life in the drop-down menu. Next, create white patches in the world. There are 2 ways to do this: either select the “draw” button and click on "ART", then click on patches in the world to create your own patch configuration, or move the slider labelled "InitialDensity" to your preferred percentage, and click "setup" to create randomly located patches ot that color. Finally, click “GO”.

To test out floral-design, first select floral-design in the drop-down menu. Next, click on the "Floralsetup" button for a initial rug pattern. Finally, click on the “GO” button, to watch our amazing automation!

## THINGS TO TRY

In this model, the user is able to use the "art" button to draw white patches and even erase them. Click on the choser "userConfiguration" to switch between drawing and erasing. The art work created by the user can be inputted into any of the three cellular automations (though we highly recommmend to use it with the game of life).


## CREDITS AND REFERENCES

We used the netlogo dictionary to search up the terms:

neighbors: Reports an agentset containing the 8 surrounding patches
 
chooser: Choosers let you choose a value for a global variable from a list of choices, presented in a drop down menu. The choices may be strings, numbers, booleans, or lists.

https://ccl.northwestern.edu/netlogo/docs/interfacetab.html
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
