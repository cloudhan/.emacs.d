(setq gc-cons-threshold 67108864) ;; 64MB

(add-to-list 'load-path "~/.emacs.d/config")

(require 'config-packages)
(require 'config-ui)
(require 'config-chinese)

(require 'lang-rust)
