(setq gc-cons-threshold 67108864) ;; 512MB

(when (eq system-type 'windows-nt)
  (setq w32-pipe-read-delay 0))

(add-to-list 'load-path "~/.emacs.d/config")
(require 'config-packages)
(require 'config-ui)
(require 'config-chinese)

(add-to-list 'load-path "~/.emacs.d/lang")
(require 'lang)
