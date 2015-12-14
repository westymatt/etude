(require 'web-mode)

(add-to-list 'auto-mode-alist '("\\.dust\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.ftl\\'" . web-mode))

(provide 'web-mode-settings)
