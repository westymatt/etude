(setq projectile-keymap-prefix (kbd "C-c p"))
(setq projectile-completion-system 'helm)
(projectile-global-mode)
(helm-projectile-on)

(provide 'projectile-mode-settings)
