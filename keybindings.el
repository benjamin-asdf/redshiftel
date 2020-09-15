(spacemacs|define-transient-state redshiftel
  :title "Redshiftel Transient State"
  :doc "
 Commands^^^^^^
----------------------------
 [_j_/_k_] more orange / blue
 [_J_/_K_] MORE orange / blue
 [_x_] reset
 [_q_] quit "
  :bindings
  ("j" redshiftel-more-orange)
  ("J" redshiftel-more-orange-big)
  ("k" redshiftel-more-blue)
  ("K" redshiftel-more-blue-big)
  ("x" redshiftel-reset)
  ("q" nil :exit t))

