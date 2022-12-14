;; (desktop-save-mode 1)

(tooltip-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; (use-package moe-theme
;;   :ensure t
;;   :config (load-theme 'moe-dark t))

;; (use-package gruvbox-theme
;;   :ensure t
;;   :config (load-theme 'gruvbox-dark-hard t))

;; (use-package rebecca-theme
;;   :ensure t
;;   :config (load-theme 'rebecca t))

(use-package kaolin-themes
  :ensure t
  :config (load-theme 'kaolin-galaxy t))

(add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono 11" ))

(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode)
  :config (setq doom-modeline-height 10))

(use-package windmove
  :bind (("C-. C-c" . windmove-up)
         ("C-. C-h" . windmove-left)
         ("C-. C-n" . windmove-right)
         ("C-. C-t" . windmove-down))
  )

;; Thanks to @devcexx <3
;; https://github.com/devcexx/emacs-config/blob/master/config/avoc-text-utils.el#L22
(defun avoc-text-utils-delete-word (arg)
  "Delete characters forward until encountering the end of a word.
With argument ARG, do this that many times."
  (interactive "p")
  (delete-region (point) (progn (forward-word arg) (point))))

(defun avoc-text-utils-backward-delete-word (arg)
  "Delete characters backward until encountering the beginning of a word.
With argument ARG, do this that many times."
  (interactive "p")
  (avoc-text-utils-delete-word (- arg)))

;; Enable vertico
(use-package vertico
  :ensure t
  :bind (:map minibuffer-local-map ("C-l" . avoc-text-utils-backward-delete-word))
  :init
  (vertico-mode)
  (setq vertico-cycle t))

(use-package orderless
  :ensure t
  :init
  (setq completion-styles '(orderless)
        completion-category-defaults nil
        completion-category-overrides '((file (styles . (partial-completion))))))

;; Persist history over Emacs restarts. Vertico sorts by history position.
(use-package savehist
  :ensure t
  :init
  (savehist-mode))

(use-package marginalia
  :after vertico
  :ensure t
  :custom
  (marginalia-annotators '(marginalia-annotators-heavy marginalia-annotators-light nil))
  :init
  (marginalia-mode))

(global-set-key (kbd "C-x C-b") 'switch-to-buffer)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)

;; Rainbow delimeters
(use-package rainbow-delimiters
  :ensure t
  :init
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
  )

;; Rainbow mode
(use-package rainbow-mode
  :ensure t
  :mode "\\.css\\'"
  )

(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Remove initial buffer
(setq inhibit-startup-screen t)

(use-package projectile
  :ensure t)

(use-package page-break-lines
  :ensure t)

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-startup-banner nil)
  (setq dashboard-items '((recents  . 5)
                          (projects . 5)
                          (agenda . 5))))

(use-package all-the-icons
  :ensure t)

(provide 'interface-settings)
