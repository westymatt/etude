(require 'cl)

(defun required-packages-installed (packages)
  (every #'package-installed-p packages))

(defun require-package (package)
  (unless (package-installed-p package)
	(package-install package)))

(defun require-packages (packages)
  (package-refresh-contents)
  (mapc #'require-package packages))

(defun verify-or-install-packages (packages)
  (unless (required-packages-installed packages)
	(require-packages packages)))

(provide 'plugin-ext)
