;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; initial window height and widht
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'default-frame-alist '(height . 32))
(add-to-list 'default-frame-alist '(width . 85))

;; disable splash screen
(setq inhibit-startup-screen t)

(when window-system
  (tool-bar-mode -1)
  (scroll-bar-mode -1))
(menu-bar-mode -1)

(when (version< "26" emacs-version)
  ; (global-display-line-numbers-mode)
  (add-hook 'prog-mode-hook (lambda () (display-line-numbers-mode))))

(setq frame-resize-pixelwise t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; config indentation and other editing related things
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun style-default ()
  (message "Use default style")
  (setq-default indent-tabs-mode nil
                tab-width 4
                c-default-style "stroustrup"))

;; leave it here as an example
;; (defun style-netease ()
;;   (message "Use NetEase style")
;;   (add-hook 'emacs-lisp-mode-hook '(lambda () (setq-local indent-tabs-mode nil)))  ;; I want my emacs config file indent with space
;;   (add-hook 'prog-mode-hook '(lambda () (setq-local indent-tabs-mode t)))
;;   (add-hook 'python-mode-hook (lambda ()
;;                                 (setq indent-tabs-mode t)
;;                                 (setq python-indent 4)
;;                                 (setq tab-width 4)))
;;   (setq tab-width 4)
;;   (setq-default indent-tabs-mode t            
;;                 c-default-style "stroustrup"))
;; (cond ((string= user-login-name "gzhanguangyun") (style-netease))
;;       (t (style-default)))
(style-default)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; install themes and load based on GUI system
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package atom-one-dark-theme :ensure t)
(use-package monokai-theme       :ensure t)
(setq term-theme 'atom-one-dark ; 'monokai
      gui-theme  'atom-one-dark)

(if (display-graphic-p)
    (load-theme gui-theme  t)
    (load-theme term-theme t))

(use-package hl-todo
  :ensure t
  ;:commands (global-hl-todo-mode)
  :hook (prog-mode . global-hl-todo-mode)
  :config
  (setq hl-todo-keyword-faces
        `(("TODO"  . ,(face-foreground 'warning))
          ("FIXME" . ,(face-foreground 'error))
          ("NOTE"  . ,(face-foreground 'success)))))


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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; install neotree
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package neotree
  :ensure t
  :defer t
  :commands (neotree-toggle)
  :bind (("C-M-l" . neotree-toggle)))

(provide 'config-ui)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; which key
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package which-key
  :ensure t
  :init
  (setq which-key-seperator " ")
  (setq which-key-prefix-prefix "+")
  (setq which-key-idle-delay 0.25)
  :config
  (which-key-mode 1))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; other config
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq show-paren-delay 0)
(show-paren-mode 1)

;; (use-package doom-modeline
;;       :ensure t
;;       :defer t
;;       :hook (after-init . doom-modeline-init))

(defmacro save-column (&rest body)
  `(let ((column (current-column)))
     (unwind-protect
         (progn ,@body)
       (move-to-column column))))
(put 'save-column 'lisp-indent-function 0)

(defun move-line-up ()
  (interactive)
  (when (not (equal 1 (line-number-at-pos)))  
    (save-column
      (transpose-lines 1)
      (forward-line -2))))

(defun move-line-down ()
  (interactive)
    (save-column
     (forward-line 1)
     (transpose-lines 1)
     (forward-line -1)))

(global-set-key (kbd "M-<up>") 'move-line-up)
(global-set-key (kbd "M-<down>") 'move-line-down)
