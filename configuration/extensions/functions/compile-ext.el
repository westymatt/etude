(defun compile-configuration-directory ()
  (interactive)
  (byte-compile-directory user-emacs-directory 0))

(provide 'compile-ext)
