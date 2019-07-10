(defconst redshifter-default-screen-temp 5400)
(defconst redshifter-step-size 500)

(defvar redshifter-curr-screen-temp nil)

(defun redshifter-set-screen-temp (temp)
  (redshifter-reset-screen)
  (shell-command (format "redshift -O %s" temp))
  (setq redshifter-curr-screen-temp temp))

(defun redshifter-reset-screen ()
  (shell-command "redshift -x"))

(defun redshifter-reset ()
  (interactive)
  (redshifter-reset-screen)
  (setq redshifter-curr-screen-temp nil))

(defun redshifter-increase ()
  (interactive)
  (let ((screen-temp))
    (if redshifter-curr-screen-temp
        (setq screen-temp (- redshifter-curr-screen-temp redshifter-step-size))
      (setq screen-temp redshifter-default-screen-temp))
    (redshifter-set-screen-temp screen-temp)))

(defun redshifter-decrease ()
  (interactive)
  (let ((screen-temp))
    (if redshifter-curr-screen-temp
        (setq screen-temp (+ redshifter-curr-screen-temp redshifter-step-size))
      (setq screen-temp redshifter-default-screen-temp))
    (redshifter-set-screen-temp screen-temp)))
