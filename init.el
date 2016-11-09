
;; Added by Package.el.  This must comes before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq gc-cons-threshold 67108864) ;; 64MB

(when (eq system-type 'windows-nt)
  (setq w32-pipe-read-delay 0))

(add-to-list 'load-path "~/.emacs.d/config")
(require 'config-packages)
(require 'config-ui)
(require 'config-chinese)

(require 'lang-cpp)
(require 'lang-rust)
(require 'lang-sml)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(package-selected-packages
   (quote
    (racer use-package solarized-theme helm company-irony auto-compile))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
