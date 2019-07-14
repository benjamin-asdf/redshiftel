(spacemacs|define-transient-state redshifter
  :title "Redshifter Transient State"
  :doc "
 Commands^^^^^^
----------------------------
 [_j_/_k_] more orange / blue
 [_J_/_K_] MORE orange / blue
 [_x_] reset
 [_q_] quit "
  :bindings
  ("j" redshifter-more-orange)
  ("J" redshifter-more-orange-big)
  ("k" redshifter-more-blue)
  ("K" redshifter-more-blue-big)
  ("x" redshifter-reset)
  ("q" nil :exit t))

(spacemacs/set-leader-keys "oer" 'spacemacs/redshifter-transient-state/body)
