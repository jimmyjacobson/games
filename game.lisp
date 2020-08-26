(in-package :com.jimmyjacobson.games)

(defclass game ()
  ((name
    :initarg :name)
   (actions
    :initform nil)))

(defclass paper-rock-scissors (game)
  ((name
    :initform 'paper-rock-scissors)
   (moves
    :initform '("PAPER" "ROCK" "SCISSORS"))))

(defun compare (p1 p2)
  ;; t if player 1 wins, nil if player 2 wins or a time.  This is ugly
  (cond
    ((or
      (and (string= p1 "PAPER") (string= p2 "ROCK"))
      (and (string= p1 "ROCK") (string= p2 "SCISSORS"))
      (and (string= p1 "SCISSORS") (string= p2 "PAPER")))
     t)
    ;; can return an error here if move wasn't one of the approved moves
    (t nil)))

(defun play (p1 p2 game)
  (let ((m1 (prompt-move (slot-value game 'moves) p1))
	(m2 (prompt-move (slot-value game 'moves) p2)))
    (format t "~a: ~a~%~a: ~a~%"
	    (slot-value p1 'name)
	    m1
	    (slot-value p2 'name)
	    m2)
    (cond
      ((eq (compare m1 m2) t) (incf (slot-value p1 'score)))
      ((eq (compare m2 m1) t) (incf (slot-value p2 'score)))
      (nil))
    (format t "Score:~%~10a:~10a~%~10a:~10a~%"
	    (slot-value p1 'name) (slot-value p1 'score)
	    (slot-value p2 'name) (slot-value p2 'score))))
