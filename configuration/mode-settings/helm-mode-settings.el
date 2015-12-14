(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(global-set-key (kbd "C-x C-r") 'helm-recentf)
(global-set-key (kbd "C-x r l") 'helm-filtered-bookmarks)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)


(setq helm-recentf-fuzzy-match t)
(setq helm-buffers-fuzzy-matching t)
(setq helm-locate-fuzzy-match t)
(setq helm-semantic-fuzzy-match t)
(setq helm-lisp-fuzzy-completion t)
(setq helm-M-x-fuzzy-match t)

(setq helm-mode t)
(setq helm-adaptive-mode t)

(setq helm-mode-fuzzy-match t)
(provide 'helm-mode-settings)
