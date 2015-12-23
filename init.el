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

(require 'system-ext)
(require 'plugin-ext)
(require 'rename-ext)
(require 'compile-ext)
(require 'display-ext)
(require 'buffer-ext)
(require 'terminal-ext)

; Settings
(require 'general-settings)
(require 'theme-settings)
(require 'powerline-settings)
(require 'os-specific-settings)

; Modes
(use-package helm
  :ensure t
  :diminish helm-mode
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
  :defer t
  :diminish projectile-mode
  :config
  (progn
	(setq projectile-keymap-prefix (kbd "C-c p"))
	(setq projectile-completion-system 'helm))
  :config
  (progn
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

(use-package web-mode
  :ensure t
  :defer t
  :config
  (progn
	(add-to-list 'auto-mode-alist '("\\.dust\\'" . web-mode))
	(add-to-list 'auto-mode-alist '("\\.ftl\\'" . web-mode))
	))
(require 'ido-mode-settings)
(require 'flycheck-mode-settings)
(require 'evil-mode-settings)

(if (file-exists-p "~/.emacs.d/local.el")
    (load-file "~/.emacs.d/local.el"))

;;; init.el ends here
