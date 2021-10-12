;; language configuration is still not complete

;; performance setting
(setq read-process-output-max (* 4 1024 1024)) ;; 4MB
(setq lsp-idle-delay 0.25)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; config lsp itself
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package lsp-mode
  :ensure t
  :init
  ;; prefix for lsp-command-keymap
  (setq lsp-keymap-prefix "C-c l")
  :hook (;; which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :commands (lsp lsp-deferred))

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :config
  (setq lsp-ui-sideline-update-mode 'point))

(use-package helm-lsp
  :ensure t
  :commands helm-lsp-workspace-symbol)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; language configurations
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package lsp-c/cpp
  :hook
  ((c-mode . lsp-deferred)
   (c++-mode . lsp-deferred)))

(use-package lsp-pyright
  :ensure t
  :hook
  (python-mode . (lambda ()
                   (require 'lsp-pyright)
                   (lsp-deferred)))
  :config
  (setq lsp-pyright-auto-import-completions nil))

(provide 'config-lsp)
