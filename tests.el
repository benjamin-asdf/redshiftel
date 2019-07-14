(defun quick-test (factor)
  (setq factor (if factor factor 1)))


(ert-deftest test-factor ()
  (should (equal 1 (quick-test nil)))
  (should (equal 3 (quick-test 3))))
