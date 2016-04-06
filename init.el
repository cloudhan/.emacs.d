(setq gc-cons-threshold 67108864) ;; 64MB

(when (eq system-type 'windows-nt)
  (setq w32-pipe-read-delay 0))

(add-to-list 'load-path "~/.emacs.d/config")
(require 'config-packages)
(require 'config-ui)
(require 'config-chinese)

(require 'lang-cpp)
(require 'lang-rust)
