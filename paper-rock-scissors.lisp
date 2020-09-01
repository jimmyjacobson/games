(in-package :com.jimmyjacobson.games)

(defun make-game (&key (max-steps 1) (player1 'robot) (player2 'robot))
  (let ((game (make-instance
	       'paper-rock-scissors
	       :players (list (make-agent player1) (make-agent player2)))))
    (init-agents (slot-value game 'players))
    (dotimes (i max-steps) (play game))))

(defun make-agent (&optional type)
  (cond
    ((string= type 'robot) (make-instance 'player))
    ((string= type 'human) (make-instance 'human))
    (t (make-instance 'player))))

(defun init-agents (agents)
  (loop for agent in agents do (init-agent agent)))
