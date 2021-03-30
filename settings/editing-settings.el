;; Multiple cursors
(use-package multiple-cursors
  :ensure t
  :bind (("C-S-c C-S-c" . mc/edit-lines)
         ("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-c C-<" . mc/mark-all-like-this))
  )

;; SmartParents
(use-package smartparens
  :ensure t
  :init (smartparens-global-mode t))

(use-package xah-math-input
  :ensure t)

;; Undo
(use-package undo-tree
  :ensure t
  :init
  (defalias 'redo 'undo-tree-redo)
  :config
  (global-undo-tree-mode 1)
  (global-set-key (kbd "C-z") 'undo)
  (global-set-key (kbd "C-S-z") 'redo)
  )

;; Indent Fucking Whole Buffer (by github.com/skgsergio)
(defun iwb ()
  "Indent whole buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max))
  (message "Indent buffer: Done.")
  )

(global-set-key "\M-i" 'iwb)

(global-set-key "\M-q" 'fill-paragraph)

;; Move text
(use-package move-text
  :ensure t
  :config
  (global-set-key [(control shift up)]  'move-text-up)
  (global-set-key [(control shift down)]  'move-text-line-down)
  )

;; Don't indent with tabs ffs!
(setq-default indent-tabs-mode nil)

;; Clean my file pl0x!
(add-hook 'before-save-hook 'whitespace-cleanup)

(use-package sudo-edit
  :ensure t)

(use-package yasnippet
  :ensure t
  :init (yas-global-mode 1)
  :config
  (define-key yas-minor-mode-map (kbd "<tab>") nil)
  (define-key yas-minor-mode-map (kbd "TAB") nil)
  (define-key yas-minor-mode-map (kbd "<C-tab>") 'yas-expand))

(provide 'editing-settings)
