;;; init.el --- Etude Emacs Configuration
;;; Commentary:
;;; A simple emacs configuration based on a few good extensions

;;; Code:
(add-to-list 'load-path "~/.emacs.d/configuration/extensions")
(add-to-list 'load-path "~/.emacs.d/configuration/extensions/functions")
(add-to-list 'load-path "~/.emacs.d/configuration/settings")
(add-to-list 'load-path "~/.emacs.d/configuration/mode-settings")
(add-to-list 'load-path "~/.emacs.d/themes")

(if (file-exists-p "~/.cask/cask.el")
	(require 'cask "~/.cask/cask.el")
  (require 'cask "/usr/local/share/emacs/site-lisp/cask/cask.el"))
(cask-initialize)
(require 'pallet)
(require 'use-package)

; GENERAL SETTINGS
;================================================================
;================================================================
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

(tool-bar-mode -1) ; DISABLE TOOLBAR
(global-linum-mode 1) ; ALWAYS SHOW LINE NUMBERS
(column-number-mode 1)
(show-paren-mode 1)
(electric-pair-mode 1)
(setq ring-bell-function 'ignore)
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

; KEY BINDINGS
(setq mac-command-modifier 'control)
(setq mac-control-modifier 'super)

(global-set-key (kbd "C-`") (lambda () (interactive) (find-file "~/.emacs.d/init.el")))
(global-set-key (kbd "C-;") 'evil-normal-state)
(global-set-key (kbd "C-+") 'toggle-frame-maximized)
(global-set-key (kbd "S-c") 'kill-ring-save)
(global-set-key (kbd "C-c i") 'find-user-init-file)
(global-set-key (kbd "C-c r") 'reload-config)
(global-set-key (kbd "C-x C-r") 'recentf-open-files)
;================================================================
;================================================================
; END GENERAL SETTINGS

(require 'system-ext)
(require 'rename-ext)
(require 'compile-ext)
(require 'display-ext)
(require 'buffer-ext)
(require 'terminal-ext)

; Settings
(require 'theme-settings)
(require 'powerline-settings)
(require 'os-specific-settings)
(require 'guide-key-settings)

; MODES
;================================================================
;================================================================
(use-package expand-region
  :ensure expand-region
  :defer t
  :bind ("C-=" . er/expand-region))

(use-package company
  :ensure t
  :config
  (add-to-list 'company-backends 'company-tern)
  (global-company-mode))

(use-package helm
  :ensure t
  :init
  (progn
	(require 'helm-config))
  :bind (("C-x b") . helm-mini)
  ("M-x" . helm-M-x)
  ("C-x C-b" . helm-buffers-list)
  ("C-x C-r" . helm-recentf)
  ("C-x r l" . helm-filtered-bookmarks)
  ("M-y" . helm-show-kill-ring)
  :config
  (progn
	(setq helm-recentf-fuzzy-match t)
	(setq helm-buffers-fuzzy-matching t)
	(setq helm-locate-fuzzy-match t)
	(setq helm-semantic-fuzzy-match t)
	(setq helm-lisp-fuzzy-completion t)
	(setq helm-M-x-fuzzy-match t)
	(setq helm-split-window-in-side-p t)

	(setq helm-mode t)
	(setq helm-adaptive-mode t)
	))

(use-package projectile
  :ensure t
  :config
  (progn
	(setq projectile-keymap-prefix (kbd "C-c p"))
	(setq projectile-completion-system 'helm)
	(projectile-global-mode)
	(helm-projectile-on)))

(use-package js3-mode
  :ensure t
  :defer t
  :config
  (progn
	(setq js3-auto-indent-p t)
	(setq js3-curly-indent-offset 0)
	(setq js3-enter-indents-newline t)
	(setq js3-expr-indent-offset 2)
	(setq js3-indent-on-enter-key t)
	(setq js3-lazy-commas t)
	(setq js3-lazy-dots t)
	(setq js3-lazy-operators t)
	(setq js3-paren-indent-offset 2)
	(setq js3-square-indent-offset 4)
	(setq js3-consistent-level-indent-inner-bracket t)
	))

(use-package tern
  :ensure t
  :config (progn
			(add-hook 'js3-mode-hook (lambda () (tern-mode t)))))

(use-package web-mode
  :ensure t
  :defer t
  :config
  (progn
	(add-to-list 'auto-mode-alist '("\\.dust\\'" . web-mode))
	(add-to-list 'auto-mode-alist '("\\.ftl\\'" . web-mode))
	))

(use-package less-css-mode
  :ensure t
  :defer t
)

(use-package ido
  :init (progn (ido-mode 1)
			   (ido-everywhere 1))
  :config
  (progn
	(setq ido-enable-flex-matching t)
	(setq ido-enable-prefix nil)
	(setq ido-everywhere t)
	(setq ido-create-new-buffer 'always)
	(setq ido-save-directory-list-file "~/.emacs.d/cache/ido/ido.last")
	(setq ido-enable-last-directory-history t)
	(setq ido-use-filename-at-point nil)
	(setq ido-case-fold t)))

(use-package ido-vertical-mode
  :ensure t
  :defer t
  :config
  (progn
	(ido-vertical-mode 1)))

(use-package flycheck
  :ensure t
  :defer t
  :config
  (progn
	(add-hook 'after-init-hook #'global-flycheck-mode)
	(add-hook 'js-mode-hook (lambda ()
							  (flychecker-select-checker 'javascript-standard)
							  (flycheck-mode)))))
(use-package cmake-mode
  :ensure t
  :config (progn
			(setq auto-mode-alist (append '(("CMakeLists\\.txt\\'" . cmake-mode)) '(("\\.cmake\\'" . cmake-mode)) auto-mode-alist))))

(use-package cmake-ide
  :ensure t
  :config (progn
		  (cmake-ide-setup)))

(use-package evil
  :ensure t
  :defer t
  :config
  (progn
	(setq evil-overriding-maps nil)
	(setq evil-intercept-maps nil)
	(evil-mode 1)))

(recentf-mode 1)
(setq recentf-max-menu-items 25)

(if (file-exists-p "~/.emacs.d/local.el")
    (load-file "~/.emacs.d/local.el"))
;================================================================
;================================================================
; END MODES SETUP

;;; init.el ends here
