(require 'ido-vertical-mode)

(ido-vertical-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq ido-create-new-buffer 'always)
(setq ido-save-directory-list-file "~/.emacs.d/cache/ido/ido.last")
(setq ido-enable-last-directory-history t)
(setq ido-use-filename-at-point nil)
(setq ido-case-fold t)
(ido-mode 'both)

(provide 'ido-mode-settings)
