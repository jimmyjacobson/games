(defparameter *moves* '('paper 'rock 'scissors))

(defun compare (p1 p2)
  ;; t if player 1 wins, nil if player 2 wins or a tie
  (cond
    ((or
      (and (string= p1 "PAPER") (string= p2 "ROCK"))
      (and (string= p1 "ROCK") (string= p2 "SCISSORS"))
      (and (string= p1 "SCISSORS") (string= p2 "PAPER")))
     t)
    (t nil)))

(defclass player ()
  ((name
    :initarg :name)
   (score
    :initarg :score
    :initform 0)))

(defclass human (player)
  ())

(defclass game ()
  ((name
    :initarg :name)
   (moves
    :initform nil)))

(defclass paper-rock-scissors (game)
  ((name
    :initform 'paper-rock-scissors)
   (moves
    :initform '("PAPER" "ROCK" "SCISSORS"))))

(defgeneric prompt-move (game player)
  (:documentation "generic method for picking a move"))

(defmethod prompt-move ((game paper-rock-scissors) player)
  (let ((moves (slot-value game 'moves)))
    (elt moves (random (length moves)))))

(defmethod prompt-move ((game paper-rock-scissors) (player human))
  (format t "PAPER, ROCK, or SCISSORS~%")
  (read))
   
(defun play (p1 p2 game)
  (let ((m1 (prompt-move game p1))
	(m2 (prompt-move game p2)))
    (format t "player 1: ~a~%player 2: ~a~%" m1 m2)
    (cond
      ((eq (compare m1 m2) t) (incf (slot-value p1 'score)))
      ((eq (compare m2 m1) t) (incf (slot-value p2 'score)))
      (nil))
    (format t "Score:~%~10a:~10a~%~10a:~10a~%"
	    (slot-value p1 'name) (slot-value p1 'score)
	    (slot-value p2 'name) (slot-value p2 'score))))


(defun make-game ()
  (let ((game (make-instance 'paper-rock-scissors))
	(p1 (make-instance 'human :name "Jimmy"))
	(p2 (make-instance 'player :name "player 2")))
    (play p1 p2 game)))

(defun keep-playing()
  (loop (make-game))))
