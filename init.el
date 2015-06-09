
;;; This file bootstraps the configuration, which is divided into
;;; a number of other files.

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(defconst *spell-check-support-enabled* nil) ;; Enable with t if you prefer
(defconst *is-a-mac* (eq system-type 'darwin))

;;----------------------------------------------------------------------------
;; Bootstrap config
;;----------------------------------------------------------------------------
(require 'init-utils)
(require 'init-site-lisp) ;; Must come before elpa, as it may provide package.el
(require 'init-elpa)      ;; Machinery for installing required packages

;;----------------------------------------------------------------------------
;; Load configs for specific features and modes
;;----------------------------------------------------------------------------

(require-package 'diminish)

(require 'init-themes)
(require 'init-keys)
(require 'init-gui-frames)
(require 'init-dired)
(require 'init-ibuffer)
(require 'init-recentf)         ;; 打开最近文件列表
(require 'init-windows)
(require 'init-deft)

(require 'init-misc)
(require 'init-fonts)
(require 'init-editing-utils)

;(require 'init-crontab)         ;; cron 文件编辑
(require 'init-markdown)
(require 'init-org)

;; Extra packages which don't require any configuration
(require-package 'htmlize)
(require-package 'browse-kill-ring)
(require-package 'phi-rectangle)        ; C-RET 矩形选择
;(require-package 'epubmode)

;;----------------------------------------------------------------------------
;; Variables configured via the interactive 'customize' interface
;;----------------------------------------------------------------------------
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

(provide 'init)

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
