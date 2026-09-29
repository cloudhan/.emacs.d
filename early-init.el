;;; early-init.el --- early init -*- no-byte-compile: t; lexical-binding: t; -*-

(setq gc-cons-threshold (if noninteractive
                            268435456 ; 256 Mb
                          most-positive-fixnum)
      gc-cons-percentage 1.0)

(setq
 ;; Defining TLS and security variables in early-init.el guarantees that any
 ;; network connection made during the initialization sequence is secure. If a
 ;; user's post-early-init.el or pre-init.el triggers a download, setting these
 ;; beforehand prevents Emacs from using default, less secure settings.
 ;; Prompts if there are cert issues.
 gnutls-verify-error t
 ;; Ensure SSL/TLS connections checks
 tls-checktrust gnutls-verify-error
 ;; Stronger GnuTLS encryption
 gnutls-min-prime-bits 3072)

(setq
 ;; Defining these early guarantees that the behavior and macro expansion of
 ;; use-package are configured before the first use-package form is evaluated in
 ;; post-early-init.el, pre-init.el, init.el, or post-init.el.
 use-package-expand-minimally t
 use-package-minimum-reported-time (if init-file-debug 0 0.1)
 use-package-verbose init-file-debug
 use-package-always-ensure (not noninteractive)
 use-package-enable-imenu-support t

 ;;; package.el

 ;; Placing the use-package-* in early-init.el ensures the package variables are
 ;; populated before package.el is initialized. This prevents cases where Emacs
 ;; might attempt to fetch from default repositories before it evaluates the
 ;; overridden variables in init.el. (This also offers the possibility to
 ;; download packages in post-early-init.el, for users who need it.)
 package-enable-at-startup nil  ; Let the init.el file handle this
 package-quickstart-file (expand-file-name "package-quickstart.el" user-emacs-directory)
 package-archives '(("melpa"        . "https://melpa.org/packages/")
                    ("gnu"          . "https://elpa.gnu.org/packages/")
                    ("nongnu"       . "https://elpa.nongnu.org/nongnu/")
                    ("melpa-stable" . "https://stable.melpa.org/packages/"))
 package-archive-priorities '(("gnu"    . 99)
                              ("nongnu" . 80)
                              ("melpa"  . 70)
                              ("melpa-stable" . 50)))
