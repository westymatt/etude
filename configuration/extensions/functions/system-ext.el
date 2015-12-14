
(defun system-is-mac ()
  (interactive)
  (string-equal system-type "darwin"))

(defun system-is-linux ()
  (interactive)
  (string-equal system-type "gnu/linux"))

(defun reload-config ()
  "reload your config without exiting emacs"
  (interactive)
  (load-file "~/.emacs.d/init.el"))

(defun find-user-init-file ()
  "edit init.el, in another window"
  (interactive)
  (find-file-other-window "~/.emacs.d/init.el"))

(provide 'system-ext)
