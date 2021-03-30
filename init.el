(add-to-list 'load-path "~/.emacs.d/settings/")
(add-to-list 'load-path "~/.emacs.d/plugins/")

(require 'package-management-settings)

(require 'interface-settings)

(require 'editing-settings)

(require 'programming-languages)

(require 'magit-settings)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(magit-gitflow magit xah-math-input use-package undo-tree sudo-edit smartparens rainbow-mode rainbow-delimiters projectile multiple-cursors move-text kaolin-themes helm-swoop helm-lsp helm-descbinds elixir-yasnippets elixir-mode doom-modeline dashboard company-box ace-jump-helm-line)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
