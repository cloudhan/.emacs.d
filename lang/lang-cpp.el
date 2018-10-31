(use-package ccls
  :ensure t
  :commands lsp-ccls-enable
  :hook (cc-mode . lsp-ccls-enable)
  )

(provide 'lang-cpp)
