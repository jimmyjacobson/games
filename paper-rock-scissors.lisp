(in-package :com.jimmyjacobson.games)

(defun make-game ()
  (let ((game (make-instance 'paper-rock-scissors))
	(p1 (make-instance 'human))
	(p2 (make-instance 'player :name "Computer")))
    (init-agent p1)
    (dotimes (i 10) (play p1 p2 game))))

(defun keep-playing()
  (loop (make-game)))
