(in-package :com.jimmyjacobson.games)

(defclass game ()
  ((name
    :initarg :name)
   (actions
    :initform nil)
   (players
    :initform nil
    :initarg :players)))

(defclass paper-rock-scissors (game)
  ((name
    :initform 'paper-rock-scissors)
   (moves
    :initform '("PAPER" "ROCK" "SCISSORS"))))

(defun compare (moves)
  ;; 1 if player 1 wins, 2 if player 2 wins or nil if a tie.  This is ugly
  (let ((p1 (elt moves 0))
	(p2 (elt moves 1)))
  (cond
    ((or
      (and (string= p1 "PAPER") (string= p2 "ROCK"))
      (and (string= p1 "ROCK") (string= p2 "SCISSORS"))
      (and (string= p1 "SCISSORS") (string= p2 "PAPER")))
     1)
    ((or
      (and (string= p2 "PAPER") (string= p1 "ROCK"))
      (and (string= p2 "ROCK") (string= p1 "SCISSORS"))
      (and (string= p2 "SCISSORS") (string= p1 "PAPER")))
     2)
    ;; can return an error here if move wasn't one of the approved moves
    (t nil))))

(defun play (game)
  (let ((p1 (elt (slot-value game 'players) 0))
	(p2 (elt (slot-value game 'players) 1)))
    (let ((m1 (prompt-move (slot-value game 'moves) p1))
	  (m2 (prompt-move (slot-value game 'moves) p2)))
      (format t "~a: ~a~%~a: ~a~%"
	      (slot-value p1 'name)
	      m1
	      (slot-value p2 'name)
	      m2)
      (let ((moves (list m1 m2)))
	(cond
	  ((eq (compare moves) 1) (incf (slot-value p1 'score)))
	  ((eq (compare moves) 2) (incf (slot-value p2 'score)))
	  (nil))
	(format t "Score:~%~10a:~10a~%~10a:~10a~%"
		(slot-value p1 'name) (slot-value p1 'score)
		(slot-value p2 'name) (slot-value p2 'score))))))
