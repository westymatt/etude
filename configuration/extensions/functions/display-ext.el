(defun modify-opacity (&optional dec)
  "modify the transparency of the emacs frame; if DEC is t,
    decrease the transparency, otherwise increase it in 10%-steps"
  (let* ((alpha-or-nil (frame-parameter nil 'alpha)) ; nil before setting
          (oldalpha (if alpha-or-nil alpha-or-nil 100))
          (newalpha (if dec (- oldalpha 5) (+ oldalpha 5))))
    (when (and (>= newalpha frame-alpha-lower-limit) (<= newalpha 100))
      (modify-frame-parameters nil (list (cons 'alpha newalpha))))))

 ;; C shift 8 will increase opacity (== decrease transparency)
 ;; C shift 9 will decrease opacity (== increase transparency
 ;; C shift 0 will returns the state to normal

(global-set-key (kbd "C-*") '(lambda()(interactive)(modify-opacity)))
(global-set-key (kbd "C-(") '(lambda()(interactive)(modify-opacity t)))
(global-set-key (kbd "C-)") '(lambda()(interactive)
                               (modify-frame-parameters nil `((alpha . 100)))))

(provide 'display-ext)
