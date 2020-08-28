# Games

Some simple, trial and error, attempts at writing game theory simulators in LISP.

## Paper Rock Scissors
Start a game with a random strategy agent and a human opponent using `(make-game)`

## Personal Notes
I prefer iterating on these examples as I learn more LISP.

`(load "./load.lisp")`

`(in-package com.jimmyjacobson.games)`

To run a single round of the game with two random robot agents use:
`(make-game)`

To run a 10 round game with a human as player 1 use
`(make-game :max-steps 10 :player1 'human)`
