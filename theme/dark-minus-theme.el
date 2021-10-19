;;; personal customization over vscode-dark-plus

(load-theme 'vscode-dark-plus)

(deftheme dark-minus)

(custom-theme-set-faces
 'dark-minus
 '(default ((t (:background "#2f2f2f"))))
 '(hl-line ((t (:background "#333333"))))
 '(mode-line ((t (:background "#444444"))))
 '(mode-line-inactive ((t (:background "#444444"))))
 )

;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'dark-minus)
(provide 'dark-minus-theme)

;;; vscode-dark-plus-theme.el ends here
