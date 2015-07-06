(defvar emacs-dir user-emacs-directory
  "Define where user load this init.el, this variable will be `~/.emacs.d/' in many case.")

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;;;; Create some dir in ramdisk
;; I bind `backup', `cache', `log' dir to /tmp/.emacs.d/, when emacs
;; startup just check if these dir exist or not, create the dir if not
;; exist.
(let ((pdir "~/.emacs.d/tmp"))
  (make-directory (concat pdir "/backup") t)
  (make-directory (concat pdir "/cache")  t)
  (make-directory (concat pdir "/log")    t))

;; Make customize-ui write file to ~/.emacs.d/custom.el
(setq custom-file (concat emacs-dir "/custom.el"))

;; define a reload command
(defun reload-emacs ()
  "reload my emacs settings"
  (interactive)
  (load-file (concat emacs-dir "init.el")) (delete-other-windows))

(require 'init-site-lisp)
(require 'init-elpa)

(require 'init-basic)
(require 'init-editor)
(require 'init-calendar)

(require 'init-org)
(require 'init-deft)
(require 'init-markdown)
(require 'init-helm)
(require 'init-ibuffer)

(provide 'init)
