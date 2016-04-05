;; config my packages

;;; repo setup
(require 'package)
(unless (assoc-default "melpa" package-archives)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
  ; (package-refresh-contents)
  )

;;; install use-package
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(setq use-package-verbose t)
(require 'use-package)

;;; use auto-compile
(use-package auto-compile :ensure t)
(auto-compile-on-load-mode)
(setq load-prefer-newer t)
(auto-compile-on-save-mode)

(use-package company
  :ensure t
  :defer
  :bind (("TAB" . company-indent-or-complete-common))
  ;;:init
  ;;(add-hook 'after-init-hook 'global-company-mode)
  :config
  (progn
    (setq company-tooltip-align-annotations t)
    (setq company-idle-delay 0.05)
    (setq company-minimum-prefix-length 3))
  )


(provide 'config-packages)
