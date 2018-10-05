;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; initial window height and widht
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'default-frame-alist '(height . 32))
(add-to-list 'default-frame-alist '(width . 85))

;; disable splash screen
(setq inhibit-startup-screen t)

(when window-system
  (tool-bar-mode -1)
  (menu-bar-mode -1)
  (scroll-bar-mode -1))

(setq frame-resize-pixelwise t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; install themes and load based on GUI system
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package atom-one-dark-theme :ensure t)
(use-package monokai-theme       :ensure t)
(setq term-theme 'monokai
      gui-theme  'atom-one-dark)

(if (display-graphic-p)
    (load-theme gui-theme  t)
    (load-theme term-theme t))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; install helm and helm-related utilities
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package helm-swoop :ensure t :defer t)
(use-package helm
  :ensure t
  :defer t
  :diminish helm-mode

  :init
  (require 'helm-config)
  (require 'helm-command)
  (require 'helm-swoop)
  (require 'helm-ring)

  (setq helm-candidate-number-limit 100)
  (setq helm-idle-delay 0.0 ; update fast sources immediately (doesn't).
	helm-input-idle-delay 0.05      ; this actually updates things  quickly.
	helm-yas-display-key-on-candidate t
	helm-quick-update t
	helm-M-x-requires-pattern nil
	helm-ff-skip-boring-files t)
  
  :config
  (helm-mode 1)

  :bind (("C-c h" . helm-mini)
         ("C-h a" . helm-apropos)
         ("C-x C-b" . helm-buffers-list)
         ("C-x b" . helm-buffers-list)
         ("M-y" . helm-show-kill-ring)
         ("M-x" . helm-M-x)
         ("C-x c o" . helm-occur)
         ("C-x c s" . helm-swoop)
         ("C-x c b" . my/helm-do-grep-book-notes)
         ("C-x c SPC" . helm-all-mark-rings)))

(provide 'config-ui)
