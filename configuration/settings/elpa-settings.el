(require 'package)
(package-initialize)

;; Add package sources
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)

(provide 'elpa-settings)
