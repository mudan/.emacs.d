;; 刷新软件包列表
;; M-x package-refresh-contents

(defvar emacs-dir user-emacs-directory
  "Define where user load this init.el, this variable will be `~/.emacs.d/' in many case.")

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;;;; Create some dir in ramdisk
;; I bind `backup', `cache', `log' dir to /tmp/.emacs.d/, when emacs
;; startup just check if these dir exist or not, create the dir if not
;; exist.
;(let ((pdir "~/.emacs.d/tmp"))
;  (make-directory (concat pdir "/backup") t)
;  (make-directory (concat pdir "/cache")  t)
;  (make-directory (concat pdir "/log")    t))

;; Fonts
;(setq face-font-rescale-alist '(("微软雅黑" . 1.2) ("Microsoft Yahei" . 1.2) ("WenQuanYi Micro Hei Mono" . 1.2)))
;(set-default-font "YaHei Consolas Coder-13")
(set-default-font "Courier New-14")
;(set-default-font "Monaco-12")
(set-fontset-font "fontset-default" 'han '("Microsoft Yahei Light"))
;(set-default-font "Noto Sans Mono CJK SC Regular-14")

;; define a reload command
(defun reload-emacs ()
  "reload my emacs settings"
  (interactive)
  (load-file (concat emacs-dir "init.el")) (delete-other-windows))

(require 'init-site-lisp)
(require 'init-elpa)

(require 'init-basic)
(require 'init-editor)
;(require 'init-font)
(require 'init-calendar)

(require 'init-org)
(require 'init-deft)
(require 'init-markdown)
(require 'init-helm)
(require 'init-ibuffer)

(provide 'init)
