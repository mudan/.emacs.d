;(require-package 'zenburn-theme)
;(require 'zenburn-theme)

;(require-package 'solarized-theme)
;(require 'solarized-theme)
;(deftheme solarized-light "The light variant of the Solrized colour theme")
;(create-solarized-theme 'light 'solarized-light)
;(provide-theme 'solarized-light)

;; 把所有的文件备份都放在一个固定的地方，三个备份
(setq make-backup-files t) ;;开启备份
(setq version-control t) ;;多版本备份
(setq kept-old-versions 2) ;;备份老版本的数量
(setq kept-new-versions 3) ;;备份新版本的数量
(setq delete-old-versions t) ;;自动删除老版本
(setq backup-by-copying t) ;;拷贝时自动备份
(setq backup-directory-alist '(("." . "~/.emacs.d/tmp/backup")))

;; 显示时间设置
(display-time-mode 1);;启用时间显示设置
(setq display-time-24hr-format t);;时间使用 24 小时制
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
;;只要里在你文档里有 Time-stamp:的设置，就会自动保存时间戳
(setq time-stamp-active t)
;;(setq time-stamp-start "最后更新时间:[ ]+\\\\?")
(setq time-stamp-start "最后更新时间:[     ]+\\\\?")
(setq time-stamp-end: "\n")
(setq time-stamp-format: "%:y 年%:m 月%:d 日")
;;自动更新 time-stamp
(add-hook 'write-file-hooks 'time-stamp)

;; 最近打开目录列表
(recentf-mode 1)
(setq recentf-max-saved-items 1000
      recentf-exclude '("/tmp/" "/ssh:"))
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

 ;; 新建文件时,自动创建缺失的目录
(defun my-create-non-existent-directory ()
      (let ((parent-directory (file-name-directory buffer-file-name)))
        (when (and (not (file-exists-p parent-directory))
                   (y-or-n-p (format "Directory `%s' does not exist! Create it?" parent-directory)))
          (make-directory parent-directory t))))
(add-to-list 'find-file-not-found-functions #'my-create-non-existent-directory)

;; eshell
;; 将 alias 保存到指定目录，备份
;; 新建一文件 alias,内容如：
;; alias 'ls 'ls -a
;; alias 'halt 'shutdown /p
(setq eshell-aliases-file "~/.emacs.d/alias")
;; 输入 em file 即可用 Emacs 在当前窗口进行文件编辑
(defalias 'em 'find-file)
;; 打开 shell
(global-set-key (kbd "C-c z") 'eshell)
;; 设置
(setq   eshell-save-history-on-exit t
	eshell-history-size 512
	eshell-hist-ignoredups t
	eshell-cmpl-ignore-case t
	eshell-cp-interactive-query t
	eshell-ln-interactive-query t
	eshell-mv-interactive-query t
	eshell-rm-interactive-query t
	eshell-mv-overwrite-files nil
	eshell-highlight-prompt t
	eshell-prompt-function    (lambda nil
				    (concat
				     (abbreviate-file-name
				      (eshell/pwd))
				     (if
					 (=
					  (user-uid)
					  0)
					 " # " " >>> "))))

;; dired
;(require 'dired-tar)   ;; 使用'T'来打包或者解压文件夹，需要 gzip 和 unzip 支持
;; 改变文件大小显示，默认调用的是 ls 命令
(setq dired-listing-switches "-alh")
;;允许复制和删除时将文件夹里所有内容一起带上
(setq dired-recursive-copies t)
(setq dired-recursive-deletes t)
;; 只打开一个 dired
(defadvice dired-find-file (around dired-find-file-single-buffer activate)
  "Replace current buffer if file is a directory."
  (interactive)
  (let ((orig (current-buffer))
        (filename (dired-get-file-for-visit)))
    ad-do-it
    (when (and (file-directory-p filename)
               (not (eq (current-buffer) orig)))
      (kill-buffer orig))))
(defadvice dired-up-directory (around dired-up-directory-single-buffer activate)
  "Replace current buffer if file is a directory."
  (interactive)
  (let ((orig (current-buffer)))
    ad-do-it
    (kill-buffer orig)))
;; s s 按照文件大小排序
;; s x 按照文件扩展名排序
;; s t 按照文件访问时间排序
;; s n 按照文件名称的字母顺序排序
(add-hook 'dired-mode-hook (lambda ()
  (interactive)
  (make-local-variable 'dired-sort-map)
  (setq dired-sort-map (make-sparse-keymap))
  (define-key dired-mode-map "s" dired-sort-map)
  (define-key dired-sort-map "s"
              '(lambda () "sort by Size"
                (interactive) (dired-sort-other (concat dired-listing-switches "S"))))
  (define-key dired-sort-map "x"
              '(lambda () "sort by eXtension"
                 (interactive) (dired-sort-other (concat dired-listing-switches "X"))))
  (define-key dired-sort-map "t"
              '(lambda () "sort by Time"
                 (interactive) (dired-sort-other (concat dired-listing-switches "t"))))
  (define-key dired-sort-map "n"
              '(lambda () "sort by Name"
                 (interactive) (dired-sort-other (concat dired-listing-switches ""))))))

(provide 'init-basic)
