
;;; This file bootstraps the configuration, which is divided into
;;; a number of other files.


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

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
(require 'init-helm)            ;; 文件查找工具

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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (helm whitespace-cleanup-mode switch-window phi-rectangle org-fstree move-dup markdown-mode htmlize guide-key fullframe dired-sort dired+ diminish diff-hl deft color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized browse-kill-ring async))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
 ;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
