(defconst redshifter-default-temp 5400)
(defconst redshifter-min 1000)
(defconst redshifter-max 25000)

(defconst redshifter-step-size 250)
(defconst redshifter-default-step-factor 1)
(defconst redshifter-big-step-factor 5)

(defvar redshifter-curr-temp nil)

(defun redshifter--set-screen-temp (temp)
  "Set the screen temperature to temp"
  (shell-command (format "redshift -r -P -O %s" temp))
  (setq redshifter-curr-temp temp))

(defun redshifter-reset ()
  "Reset redshifter screen temp"
  (interactive)
  (shell-command "redshift -x")
  (setq redshifter-curr-temp nil))

(defun redshifter-more-orange ()
  "Change screen temp to be a bit more orange"
  (interactive)
  (redshifter-change '-))

(defun redshifter-more-orange-big ()
  "Change screen temp to be way more orange. See also redshifter-more-orange"
  (interactive)
  (redshifter-change '- redshifter-big-step-factor))

(defun redshifter-more-blue ()
  "Change screen temp to be a bit more blue"
  (interactive)
  (redshifter-change '+))

(defun redshifter-more-blue-big ()
  "Change screen temp to be way more blue. See also redshifter-more-blue"
  (interactive)
  (redshifter-change '+ redshifter-big-step-factor))

(defun redshifter-change (op &optional factor)
  "Set screen temp and keep track of currently set screen temp. op should be either + or -,
for more blue or more orange. Provide a factor to influence step size."
  (interactive)
  (setq factor (if factor factor redshifter-default-step-factor))
  (let ((screen-temp))
    (if redshifter-curr-temp
        (setq screen-temp (funcall op redshifter-curr-temp (* redshifter-step-size factor)))
      (setq screen-temp redshifter-default-temp))
    (if (or (> screen-temp redshifter-max) (< screen-temp redshifter-min))
        (message "redshifter bounds reached.")
      (redshifter--set-screen-temp screen-temp))))
