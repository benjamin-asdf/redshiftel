(defconst redshifter-default-temp 5400)
(defconst redshifter-step-size 500)
(defconst redshifter-min 1000)
(defconst redshifter-max 25000)

(defvar redshifter-curr-temp nil)

(defun redshifter--set-screen-temp (temp)
  (shell-command (format "redshift -r -P -O %s" temp))
  (setq redshifter-curr-temp temp))

(defun redshifter-reset ()
  (interactive)
  (shell-command "redshift -x")
  (setq redshifter-curr-temp nil))

(defun redshifter-more-orange ()
  (interactive)
  (redshifter-change '-))

(defun redshifter-more-blue ()
  (interactive)
  (redshifter-change '+))

(defun redshifter-change (op)
  (interactive)
  (let ((screen-temp))
    (if redshifter-curr-temp
        (setq screen-temp (funcall op redshifter-curr-temp redshifter-step-size))
      (setq screen-temp redshifter-default-temp))
    (if (> screen-temp redshifter-max)
        (setq screen-temp redshifter-max))
    (if (< screen-temp redshifter-min)
        (setq screen-temp redshifter-min))
    (redshifter--set-screen-temp screen-temp)))
