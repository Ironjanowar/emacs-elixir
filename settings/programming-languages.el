(use-package elixir-mode
  :ensure t)

(setq lsp-keymap-prefix "M-s")

(use-package lsp-mode
  :ensure t
  :hook ((elixir-mode . lsp)
         (before-save . lsp-format-buffer)
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp
  :init
  (add-to-list 'exec-path "~/.emacs.d/settings/elixir-ls/elixir-ls-1.11")
  (setq lsp-enable-file-watchers nil))

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

(provide 'programming-languages)
