;; language configuration is still not complete

(use-package lsp-python
  :ensure t
  :ensure lsp-mode

  :init
  (require 'lsp-mode)
  (require 'lsp-python)
  (add-hook 'python-mode-hook 'lsp-python-enable)
  (add-hook 'python-mode-hook 'lsp-ui-mode))
  

(provide 'lang-python)
