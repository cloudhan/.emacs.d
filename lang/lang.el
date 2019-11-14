;; language configuration is still not complete

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; config lsp itself
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :diminish
  :init 
  (setq lsp-eldoc-render-all nil))


(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :config
  (setq lsp-ui-sideline-update-mode 'point))

(use-package company-lsp
  :commands company-lsp)

(use-package helm-lsp
  :ensure t
  :commands helm-lsp-workspace-symbol)

; (use-package dap-mode
;   :ensure t
;   :defer t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; language configurations
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'cc-mode-hook #'lsp-deferred)

; (use-package lsp-python-ms
;   :ensure t
;   :defer t
;   :hook (python-mode . (lambda ()
;                           (require 'lsp-python-ms)
;                           (lsp-deferred))))

(provide 'lang)
