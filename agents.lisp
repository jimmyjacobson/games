(in-package :com.jimmyjacobson.games)

;; Base Class for agents
(defclass player ()
  ((name
    :initarg :name)
   (score
    :initarg :score
    :initform 0)))

(defgeneric init-agent (player)
  (:documentation "generic method for initializing an agent"))

(defmethod init-agent ((robot player))
  (declare (ignore robot)))

(defgeneric prompt-move (moves player)
  (:documentation "generic method for picking a move"))

(defmethod prompt-move (moves player)
  ;; returns a random item from the moves set
  (elt moves (random (length moves))))
  
;; Human players have different methods for initializing and prompting moves
(defclass human (player)
  ())

(defmethod init-agent ((player human))
  (format t "What is your name? >")
  (setf (slot-value player 'name) (read))
  (format t "Welcome, ~a.  Let's play!~%" (slot-value player 'name)))

(defmethod prompt-move (moves (player human))
  (format t "Pick One: ~S~%> " moves)
  (read))
