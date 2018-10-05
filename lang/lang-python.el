;; language configuration is still not complete
;; seems work now...
;; notice, use pyls==0.20, 0.21 will crash on windows
;; but still laggy when complete...

(use-package lsp-python
  :ensure t

  :after lsp-mode

  :commands lsp-python-enable

  :hook (python-mode . lsp-python-enable)

  :config
  (lsp-define-stdio-client lsp-python "python"
			   (lsp-make-traverser
			    #'(lambda (dir)
				(directory-files
				 dir
				 nil
				 "\\(__init__\\|setup\\|manage\\)\\.py\\|requirements.txt")))
			   '("C:/Python27amd64/Scripts/pyls.exe")))
  

(provide 'lang-python)
