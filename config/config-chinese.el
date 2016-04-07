;;; set encoding charset
(prefer-coding-system 'utf-8-unix)

(when (eq system-type 'windows-nt)
  (set-default 'process-coding-system-alist
	       '(("[pP][lL][iI][nN][kK]" gbk-dos . gbk-dos)
		 ("[cC][mM][dD][pP][rR][oO][xX][yY]" gbk-dos . gbk-dos)))

  (set-face-font 'default (font-spec :family "Consolas" :size 15))
  (dolist (charset '(han gb18030 chinese-gbk cjk-misc gb18030))
    (set-fontset-font "fontset-default" charset
		      (font-spec :family "微软雅黑"))))
(setq face-font-rescale-alist
      '((".*微软雅黑.*" . 1.125)
	(".*思源黑体.*" . 1.125)
	(".*Source Han Sans .*" . 1.15)))

;;; useful command describe-font describe-fontset
;;; describe-char


(provide 'config-chinese)
