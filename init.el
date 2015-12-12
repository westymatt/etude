(add-to-list 'load-path "~/.emacs.d/configuration/extensions")
(add-to-list 'load-path "~/.emacs.d/configuration/extensions/functions")
(add-to-list 'load-path "~/.emacs.d/configuration/settings")
(add-to-list 'load-path "~/.emacs.d/configuration/mode-settings")

(require 'system-ext)
(require 'plugin-ext)
(require 'rename-ext)
(require 'compile-ext)
(require 'display-ext)
(require 'buffer-ext)

(require 'elpa-settings)
(defvar packages
  '(
    helm
    helm-ag
    helm-swoop
    helm-ls-git
    helm-projectile
	js3-mode
	powerline
	exec-path-from-shell
    ) "Dependencies")

(defvar themes
  '(
    tronesque-theme
    slime-theme
    spacegray-theme
    monokai-theme
    atom-dark-theme
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

(if (file-exists-p "~/.emacs.d/local.el")
    (load-file "~/.emacs.d/local.el"))
