(when (eq system-type 'darwin)
  (exec-path-from-shell-initialize))

(provide 'os-specific-settings)
