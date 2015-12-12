(defun rename-this-buffer-and-file ()
  "Renames current buffer and file it is visiting."
  (interactive)
  (let ((name (buffer-name))
		(filename (buffer-file-name)))
	(if (not (and filename (file-exists-p filename)))
		(error "Buffer '%s' is not visiting a file!" name)
	  (let ((new-name (read-file-name "New name: " filename)))
		(cond ((get-buffer new-name)
			   (error "A buffer named '%s' already exists!" new-name))
			  (t
			   (rename-file filename new-name 1)
			   (rename-buffer new-name)
			   (set-visited-file-name new-name)
			   (set-buffer-modified-p nil)
			   (message "File '%s' successfully renamed to '%s'" name (file-name-nondirectory new-name))))))))

(provide 'rename-ext)
