(defconst redshifter-default-temp 5400)
(defconst redshifter-step-size 500)

(defconst redshifter-min 10000)
(defconst redshifter-max 25000)

(defvar redshifter-curr-temp nil)

(defun redshifter--set-screen-temp (temp)
  (shell-command (format "redshift -r -P -O %s" temp))
  (setq redshifter-curr-temp temp))

(defun redshifter-reset ()
  (interactive)
  (shell-command "redshift -x")
  (setq redshifter-curr-temp nil))


(defun redshifter-change-screen-temp (increase)
  (interactive "P")
  ;;TODO
  )


(defun redshifter-test-increase ()
  (interactive)
  )

;;TODO
(defun redshifter-new-screen-temp (increase)
  (interactive "P")
  (let ((temp (or redshifter-curr-temp redshifter-default-temp)))
    (when increase (- temp redshifter-step-size)
          (+ temp redshifter-step-size))
    (message (format "new screen temp would be %s" temp))

    ))

(defun redshifter-increase ()
  (interactive)
  (let ((screen-temp))
    (if redshifter-curr-temp
        (setq screen-temp (- redshifter-curr-temp redshifter-step-size))
      (setq screen-temp redshifter-default-temp))
    (redshifter-set-screen-temp screen-temp)))

(defun redshifter-decrease ()
  (interactive)
  (let ((screen-temp))
    (if redshifter-curr-temp
        (setq screen-temp (+ redshifter-curr-temp redshifter-step-size))
      (setq screen-temp redshifter-default-temp))
    (redshifter-set-screen-temp screen-temp)))
