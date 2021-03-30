;; Magit
(use-package magit
  :ensure t
  :bind (("C-c g" . magit-status)
         ("C-x M-g" . magit-dispatch-popup))
  )

;; Git Flow
(use-package magit-gitflow
  :ensure t
  :init
  (setq magit-gitflow-popup-key ".")
  :config
  (add-hook 'magit-mode-hook 'turn-on-magit-gitflow))

(provide 'magit-settings)
