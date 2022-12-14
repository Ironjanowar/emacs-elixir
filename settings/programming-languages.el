(use-package web-mode
  :ensure t
  :mode "\\.html.leex\\'"
  :custom
  (web-mode-markup-indent-offset 2)
  (web-mode-css-indent-offset 2)
  (web-mode-code-indent-offset 2))

(use-package elixir-mode
  :ensure t
  :config)

(setq lsp-keymap-prefix "M-s")

(use-package which-key
  :ensure t
  :init
  (which-key-mode))

(use-package lsp-mode
  :ensure t
  :hook ((elixir-mode . lsp)
         (before-save . lsp-format-buffer)
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp
  :init
  ;; (add-to-list 'exec-path "~/.emacs.d/settings/elixir-ls/elixir-ls-1.13-compiled")
  (add-to-list 'exec-path "~/.emacs.d/settings/elixir-ls/elixir-ls-1.14-25.1")
  (setq lsp-enable-file-watchers nil))

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package lsp-ui
  :ensure t
  :init
  (setq lsp-ui-doc-enable nil
        lsp-ui-flycheck-enable t
        lsp-prefer-flymake nil
        lsp-log-io nil))

(use-package helm-lsp
  :ensure t
  :diminish lsp-mode
  :commands helm-lsp-workspace-symbol)

(use-package elixir-yasnippets
  :ensure t)

(use-package company
  :ensure t
  :after lsp
  :hook (prog-mode . company-mode))

(use-package company-box
  :ensure t
  :hook (company-mode . company-box-mode))

(use-package projectile
  :ensure t
  :config
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "M-p") 'projectile-command-map))

(provide 'programming-languages)
