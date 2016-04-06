(defun my-cc-mode-hook () 
  (c-set-style "stroustrup"))
(add-hook 'c-mode-common-hook 'my-cc-mode-hook)
(add-hook 'c-mode-common-hook 'company-mode)

(use-package company-irony
  :ensure t
  :defer
  
  :init
  (eval-after-load 'company
    '(add-to-list 'company-backends 'company-irony))
  )

(use-package irony
  :ensure
  :defer

  :init
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook 'irony-mode)
  ;;(add-hook 'objc-mode-hook 'irony-mode)
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
  (with-eval-after-load 'irony
    (define-key irony-mode-map (kbd "C-j") #'irony-completion-at-point-async))
  )


(provide 'lang-cpp)
