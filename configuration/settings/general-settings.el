(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

(setq auto-save-default nil auto-save-timeout 0)
(setq auto-save-list-file-prefix nil)
(setq backup-inhibited t)
(setq make-backup-files nil)
(setq show-trailing-whitespace t)
(toggle-truncate-lines)
(setq-default truncate-lines 0)
(setq-default tab-width 4)
(setq tab-width 4)
(setq line-number-mode t)
(setq column-number-mode t)
(global-hl-line-mode 1)

(setq-default case-fold-search 1)

(setq-default show-trailing-whitespace t)

(transient-mark-mode 1)

(scroll-bar-mode 0)

(menu-bar-mode 0)

;; ===== Disable toolbar =====
(tool-bar-mode -1)

;; ===== Always show line numbers =====
(global-linum-mode 1)

(column-number-mode 1)

;;(global-visual-line-mode 1)

(show-paren-mode 1)
(electric-pair-mode 1)

(setq ring-bell-function 'ignore)

;(global-set-key (kbd "C-x C-b") 'ibuffer)
;(autoload 'ibuffer "ibuffer" "List buffers." t)

(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

(global-set-key (kbd "C-c i") 'find-user-init-file)
(global-set-key (kbd "C-c r") 'reload-config)
(provide 'general-settings)
