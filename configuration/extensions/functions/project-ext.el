(defconst project-settings-directory "~/.emacs.d/project-settings"
  "Directory for housing project specific settings")

(defun generate-project-settings-path (project)
  (concat project-settings-directory "/" project ".el"))

(defun ensure-project-settings-directory ()
  (if (not (file-exists-p project-settings-directory))
	  (minibuffer-message "Creating project-settings directory")
	  (make-directory project-settings-directory)))

(defun load-project-settings (project)
  "Load Project Specific Settings"
  (interactive "sProject:")
  (ensure-project-settings-directory)
  (let ((project-settings-path (generate-project-settings-path project)))
	(minibuffer-message project-settings-path)
	(if (file-exists-p project-settings-path)
		(load-file project-settings-path)
	  (minibuffer-message "Can't find project settings for %s" project))))

(provide 'project-ext)
