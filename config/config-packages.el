;; config my packages

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; repo setup
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; install use-package if not installed, then load
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(setq use-package-verbose t)
;; this is suggested by https://github.com/jwiegley/use-package
(eval-when-compile
  (require 'use-package))
(use-package diminish :ensure :defer t)
(use-package bind-key :ensure :defer t)
(require 'diminish)
(require 'bind-key)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; use auto-compile
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package auto-compile
  :ensure t
  :config
  (auto-compile-on-load-mode)
  (setq load-prefer-newer t)
  (auto-compile-on-save-mode))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; load and config company
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package company
  :ensure t

  :bind (("TAB" . company-indent-or-complete-common)
         ("C-j" . company-complete-common))

  :init
  (add-hook 'after-init-hook 'global-company-mode)

  :config
  (setq company-tooltip-align-annotations t)
  (setq company-idle-delay 0.05)
  (setq company-minimum-prefix-length 3))

(use-package company-lsp
  ;:after company ;this cause problem...
  :ensure t
  :config
  (setq company-lsp-cache-candidates t))

(provide 'config-packages)
