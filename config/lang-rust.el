;;(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

(use-package racer
  :ensure t
  :defer
  :init
  (progn
    ;; should add racer executable to path
    ;; (setq racer-cmd "<path-to-racer-srcdir>/target/release/racer")
    (when (string-equal system-type "windows-nt")
      (setq racer-rust-src-path "C:/rust/src/"))
    (add-hook 'racer-mode-hook #'eldoc-mode)
    (add-hook 'racer-mode-hook #'company-mode)
    )
  )

(use-package rust-mode
  :ensure t
  :mode ("\\.rs\\'" . rust-mode)
  :init
  (progn
    (add-hook 'rust-mode-hook #'racer-mode)
    )
  :config
  (autoload 'rust-mode "rust-mode" nil t)
  )


(provide 'lang-rust)
