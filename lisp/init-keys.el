;; C-c ←  退回你的上一个窗口设置
(when (fboundp 'winner-mode)
  (winner-mode)
  (windmove-default-keybindings))

;; 打开 eshell
(global-set-key (kbd "C-c z") 'eshell)

;; calendar
(global-set-key (kbd "C-c C-d") 'calendar)

;; browse-kill-ring
(global-set-key (kbd "C-c k") 'browse-kill-ring)

;; align regexp 对齐选定文本
;; (global-set-key (kbd "<f1>") 'align-regexp)

;; deft
(global-set-key (kbd "<f1>") 'deft)

;; 逐个询问式查找替换
(global-set-key (kbd "<f2>") 'query-replace)

;; rect-mark.el 直观矩形操作
;(global-set-key (kbd "<f3>") 'rm-exchange-point-and-mark)

;; 无条件替换指定文字
(global-set-key (kbd "<f3>") 'replace-regexp)

;; 跳至指定行数
(global-set-key (kbd "<f4>")  'goto-line)


(provide 'init-keys)
