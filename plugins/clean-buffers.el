(defun kill-buffers()
  (let (buffer buffers)
    (setq buffers (buffer-list))
    (dotimes (i (length buffers))
      (setq buffer (pop buffers))
      (if (not (string-equal (buffer-name buffer) "*scratch*")) (kill-buffer buffer) nil))))

(defun clean-buffers()
       (interactive)
       (if (yes-or-no-p "Do you really want to clean all buffers? ")
           (kill-buffers) nil))

(global-set-key (kbd "C-x C-k") 'clean-buffers)

(provide 'clean-buffers)
