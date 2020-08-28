(in-package :com.jimmyjacobson.games)

(defun make-game (&key (max-steps 1) (player1 'robot) (player2 'robot))
  (let ((game (make-instance 'paper-rock-scissors))
	(p1 (make-agent player1))
	(p2 (make-agent player2)))
    (init-agent p1)
    (init-agent p2)
    (dotimes (i max-steps) (play p1 p2 game))))

(defun make-agent (&optional type)
  (cond
    ((string= type 'robot) (make-instance 'player :name "Computer"))
    ((string= type 'human) (make-instance 'human))
    (t (make-instance 'player :name "Computer"))))
