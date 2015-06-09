;;----------------------------------------------------------------------------
;; Misc config - yet to be placed in separate files
;;----------------------------------------------------------------------------

;; TAB 无声
(setq visible-bell t)

;; big kill ring
(setq kill-ring-max 1000)

;; 以 y/n代表 yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; 自动打开图片
(auto-image-file-mode t)

;;shell色彩信息能够被 Emacs 正确解析
(autoload 'ansi-color-for-comint-mode-on "ansi-color" t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on t)

;;设置有用的个人信息
(setq user-full-name "mudan")
(setq user-mail-address "mudand88@gmail.com")

;; 把所有的文件备份都放在一个固定的地方，三个备份
(setq version-control t)
(setq kept-old-versions 2)
(setq kept-new-versions 3)
(setq delete-old-versions t)
(setq backup-directory-alist '(("." . "~/.emacs.d/tmp")))
(setq backup-by-copying t)

;;--显示时间设置--
(display-time-mode 1);;启用时间显示设置
(setq display-time-24hr-format t);;时间使用24小时制
(setq display-time-day-and-date t);;时间显示包括日期和具体时间
(setq display-time-use-mail-icon t);;时间栏旁边启用邮件设置
(setq display-time-interval 10);;时间的变化频率
;;时间戳设置，插入文档内的
(defun my-timestamp ()
  "Insert the \"Time-stamp: <>\" string at point."
  (interactive)
  (if (interactive-p)
      (insert " Time-stamp: <>")
    " Time-stamp: <>"))
;;时间戳设置(time-stamp)，设定文档上次保存的信息
;;只要里在你文档里有Time-stamp:的设置，就会自动保存时间戳
(setq time-stamp-active t)
;;(setq time-stamp-start "最后更新时间:[ ]+\\\\?")
(setq time-stamp-start "最后更新时间:[     ]+\\\\?")
(setq time-stamp-end: "\n")
(setq time-stamp-format: "%:y年%:m月%:d日")
;;自动更新time-stamp
(add-hook 'write-file-hooks 'time-stamp)

(provide 'init-misc)
