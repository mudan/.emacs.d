(require-package 'helm)
(require 'helm)
(require 'helm-config)
;(require 'helm-dash)

;;      C-n/C-p         移动光标
;;      C-v/M-v         快速移动
;;      C-c C-i         将路径插入缓冲区
;;      C-x b           helm-mini，完全可以代替原先选择缓冲区打开的命令
;;      M-a             选择所有，可与 C-c C-i 配合使用
;;                      本来还有 C-SPC 标记一个，但与中文输入法冲突……
;;      C-x c M-x       helm-M-x，

(helm-mode 1)
(helm-autoresize-mode 1)
;(setq helm-ff-auto-update-initial-value nil)    ; 禁止自动补全

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-s") 'helm-occur)

(setq helm-split-window-in-side-p           t
      helm-move-to-line-cycle-in-source     t
      helm-ff-search-library-in-sexp        t
      helm-M-x-fuzzy-match                  t   ; 模糊搜索 helm-M-x
      helm-buffers-fuzzy-matching           t
      helm-locate-fuzzy-match               t
      helm-recentf-fuzzy-match              t
      helm-scroll-amount                    8
      helm-ff-file-name-history-use-recentf t)

(provide 'init-helm)
