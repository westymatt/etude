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

;;; Settings

;;; General
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
(setq redisplay-dont-pause t)
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

(defun load-user-init-file-in-buffer ()
  (interactive)
  (switch-to-buffer (find-file-noselect "~/.emacs.d/init.el")))
(global-set-key (kbd "C-c i") 'load-user-init-file-in-buffer)

;;; Theme
(load-theme 'calmer-forest :no-confirm)

(when (eq system-type 'darwin)
  (set-frame-font "DejaVu Sans-10" t t)
  (exec-path-from-shell-initialize))

;;; Bindings
(global-set-key (kbd "C-c c") 'comment-region)
(global-set-key (kbd "C-c u") 'uncomment-region)

;;; Modes
(use-package powerline
  :ensure t
  :config (progn
			(powerline-evil-vim-color-theme)))

(use-package expand-region
  :ensure t
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
	(setq js3-consistent-level-indent-inner-bracket t)
	(setq js3-expr-indent-offset 2)
	(setq js3-indent-on-enter-key t)
	(setq js3-lazy-commas t)
	(setq js3-lazy-operators t)
	(setq js3-paren-indent-offset 2)
	(setq js3-square-indent-offset 2)))

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

(use-package ido
  :config
  (progn
	(setq ido-enable-flex-matching t)
	(setq ido-enable-prefix nil)
	(setq ido-everywhere t)
	(setq ido-create-new-buffer 'always)
	(setq ido-save-directory-list-file "~/.emacs.d/cache/ido/ido.last")
	(setq ido-enable-last-directory-history t)
	(setq ido-use-filename-at-point 'nil)
	(setq ido-case-fold t)
	(ido-mode 'both)
	(ido-everywhere t)))

(use-package ido-vertical-mode
  :ensure t
  :defer t
  :config
  (progn
	(ido-vertical-mode 1)))

(use-package neotree
  :ensure t
  :defer t
  :config
  (progn
	(setq projectile-switch-project-action 'neotree-projectile-action)))

(use-package flycheck
  :ensure t
  :defer t
  :config
  (progn
	(add-hook 'after-init-hook #'global-flycheck-mode)
	(add-hook 'js3-mode-hook (lambda ()
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

(use-package undo-tree
  :diminish undo-tree-mode
  :init (global-undo-tree-mode))

(use-package evil
  :disabled t
  :ensure t
  :defer t
  :config
  (progn
	(setq evil-search-module 'evil-search
		  evil-want-C-u-scroll t
		  evil-want-C-w-in-emacs-state t)
	(evil-mode 1)))

(use-package god-mode
  :disabled t
  :ensure t
  :defer t
  :init
  (god-mode-all)
  (setq
   god-exempt-major-modes '(dired-mode grep-mode vc-annotate-mode eshell-mode shell-mode neotree-mode)
   god-exempt-predicates (list #'god-exempt-mode-p))
  :config
  (progn
	(global-set-key (kbd "<escape>") 'god-local-mode)
	))

(if (file-exists-p "~/.emacs.d/local.el")
    (load-file "~/.emacs.d/local.el"))

;;; init.el ends here
(put 'erase-buffer 'disabled nil)
