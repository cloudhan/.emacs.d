;;; set encoding charset
(prefer-coding-system 'utf-8-unix)

(when (eq system-type 'windows-nt)
  (set-default 'process-coding-system-alist
	       '(("[pP][lL][iI][nN][kK]" gbk-dos . gbk-dos)
		 ("[cC][mM][dD][pP][rR][oO][xX][yY]" gbk-dos . gbk-dos))))


;;;(set-face-font 'default "Consolas-12.0")
(set-face-font 'default (font-spec :family "Consolas" :size 12.0))
(dolist (charset '(han gb18030 chinese-gbk cjk-misc gb18030))
  (set-fontset-font "fontset-default" charset
		    (font-spec :family "思源黑体 CN Regular"
			       )))
(setq face-font-rescale-alist
      '((".*思源黑体.*" . 1.13045)
	(".*Source Han Sans .*" . 1.15)))

;;; useful command describe-font describe-fontset
;;; describe-char


(provide 'config-chinese)
