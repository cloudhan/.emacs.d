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

(setq w32-pipe-read-delay 0)
(use-package company
  :ensure t
  :defer 5
  :diminish
  :commands (company-mode
             global-company-mode
             company-complete-common
             company-indent-or-complete-common)

  :bind (; ("TAB" . company-indent-or-complete-common)
         ("C-j" . company-complete-common))

  :hook (after-init . global-company-mode)

  :config
  (setq company-backends '(company-capf
                           company-keywords
                           company-files
                           company-cmake))
  (setq company-tooltip-offset-display 'scrollbar
        company-tooltip-align-annotations t
        company-selection-wrap-around t
        company-minimum-prefix-length 3
        company-tooltip-limit 10
        company-idle-delay 0.3
        company-echo-delay 0
        company-require-match nil
        company-tooltip-margin 2
        company-async-wait 0.03
        company-async-timeout 2
        )
  )

(require 'cmake-mode)

(provide 'config-misc)
