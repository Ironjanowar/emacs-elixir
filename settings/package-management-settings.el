(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/") t)
  (add-to-list
   'package-archives
   '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/") t)
  (package-initialize))

(unless (featurep 'use-package)
  (package-refresh-contents)
  (package-install 'use-package)
  )

(setq make-backup-files nil) ;; Hello GIT

(setq backup-directory-alist '(("" . "~/.emacs.d/backup")))

(use-package exec-path-from-shell
  :ensure t
  :config
  (exec-path-from-shell-copy-env "SSH_AGENT_PID")
  (exec-path-from-shell-copy-env "SSH_AUTH_SOCK"))

(provide 'package-management-settings)
