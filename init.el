(setq gc-cons-threshold (* 256 1024 1024)) ;; 256MB
(setq package--init-file-ensured t)
(setq create-lockfiles nil)
(setq custom-file (concat user-emacs-directory "custom-set-variables.el"))
(load custom-file 'noerror)

;; Don't compact font caches during GC.  If you are expereicing the
;; laggy issue especially on Windows, please set to non-nil.
(setq inhibit-compacting-font-caches t)

(when (eq system-type 'windows-nt)
  (setq w32-pipe-read-delay 0))

(add-to-list 'custom-theme-load-path "~/.emacs.d/theme")
(load-theme 'leuven t)
(load-theme 'vscode-dark-plus)
(load-theme 'dark+-modified t)

(add-to-list 'load-path "~/.emacs.d/config")
(require 'config-misc)
(require 'config-ui)
(require 'config-lsp)
(require 'config-chinese)
