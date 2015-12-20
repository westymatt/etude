;;; init.el --- Etude Emacs Configuration
;;; Commentary:
;;; A simple emacs configuration based on a few good extensions

;;; Code:
(add-to-list 'load-path "~/.emacs.d/configuration/extensions")
(add-to-list 'load-path "~/.emacs.d/configuration/extensions/functions")
(add-to-list 'load-path "~/.emacs.d/configuration/settings")
(add-to-list 'load-path "~/.emacs.d/configuration/mode-settings")
(add-to-list 'load-path "~/.emacs.d/themes")

(require 'manoj-dark-theme)

(require 'system-ext)
(require 'plugin-ext)
(require 'rename-ext)
(require 'compile-ext)
(require 'display-ext)
(require 'buffer-ext)
(require 'terminal-ext)

(require 'elpa-settings)
(defvar packages
  '(
	magit
    helm
    helm-ag
    helm-swoop
    helm-projectile
	ido-vertical-mode
	flycheck
	js3-mode
	web-mode
	powerline
	exec-path-from-shell
    ) "Dependencies")

(defvar themes
  '(
    tronesque-theme
    slime-theme
    cyberpunk-theme
    ) "Themes")

(verify-or-install-packages packages)
(verify-or-install-packages themes)

; Settings
(require 'general-settings)
(require 'theme-settings)
(require 'powerline-settings)
(require 'os-specific-settings)

; Modes
(require 'helm-mode-settings)
(require 'projectile-mode-settings)
(require 'js3-mode-settings)
(require 'web-mode-settings)
(require 'ido-mode-settings)
(require 'flycheck-mode-settings)

(if (file-exists-p "~/.emacs.d/local.el")
    (load-file "~/.emacs.d/local.el"))

;;; init.el ends here
