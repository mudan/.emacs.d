;;显示列号
(column-number-mode 1)

;;显示 buffer size
(size-indication-mode 1)

;; 缩小工具条
(tool-bar-mode -1)

;; TAB 无声
(setq visible-bell t)

;; big kill ring
(setq kill-ring-max 1000)

;; 语法加亮
(global-font-lock-mode t)

;; 加快语法刷新速度
(set-variable 'jit-lock-stealth-time 0)

;; 自动插入引号/括号配对
(electric-pair-mode 1)

;; 匹配括号
(show-paren-mode 1)

;; 以 y/n 代表 yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; 打开压缩文件时自动解压缩
(auto-compression-mode 1)

;; 自动打开图片
(auto-image-file-mode t)

;; 自动保存当前 buffer
;(add-hook 'focus-out-hook 'save-buffer)
;; 保存所有 buffer
;(add-hook 'focus-out-hook (lambda () (save-some-buffers t)))

;; shell 色彩信息能够被 Emacs 正确解析
(autoload 'ansi-color-for-comint-mode-on "ansi-color" t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on t)

;; 设置有用的个人信息
(setq user-full-name "mudan")
(setq user-mail-address "mudand88@gmail.com")

;; History
(setq savehist-file "~/.emacs.d/savehist")
(savehist-mode 1)
(setq history-length t)
(setq history-delete-duplicates t)
(setq savehist-save-minibuffer-history 1)
(setq savehist-additional-variables
      '(kill-ring
	search-ring
	regexp-search-ring))

;; 字符编码
;(setq locale-coding-system 'utf-8)
;(set-terminal-coding-system 'utf-8)
;(set-keyboard-coding-system 'utf-8)
;(set-selection-coding-system 'utf-8)
;; 系统编码
;(prefer-coding-system 'utf-8 )
;; 语言环境
;(set-language-environment 'utf-8 )
;; 文件保存时的编码
(set-buffer-file-coding-system 'utf-8 )
;; 读写缓冲区编码
(setq coding-system-for-read 'utf-8)
(setq coding-system-for-write 'utf-8)
(setq list-faces-sample-text
      (concat
       "ABCDEFTHIJKLMNOPQRSTUVWXYZ abcdefghijklmnopqrstuvwxyz\n"
       "11223344556677889900       壹貳參肆伍陸柒捌玖零"))
; 显示特殊符号
(set-fontset-font t 'unicode "Symbola" nil 'append)
(set-fontset-font t 'unicode "Segoe UI Emoji" nil 'append)
(set-fontset-font t 'unicode "STIX" nil 'prepend)
;; prettify-symbols-mode 将各种标识符号改成更美观的字符
;; 可以参考 vim 中同类插件 haskell.vim
;(global-prettify-symbols-mode 1)
(defconst lisp--prettify-symbols-alist
  '(("lambda"  . ?λ)
    ("pi" . ?π)
    ("sum" . ?∑)
    ("elem" . ?∈)
    ("notElem" . ?∉)
    ("<=" . ?≤)
    (">=" . ?≥)
    ("-<" . ?↢)
    (">-" . ?↣)
    ("div" . ?÷)))

;; 矩形操作
(require-package 'phi-rectangle)
(require 'phi-rectangle)
(phi-rectangle-mode 1)

;; 清除空格
(require-package 'whitespace-cleanup-mode)
(global-whitespace-cleanup-mode t)

;; 中英文之间自动添加空格
(require-package 'pangu-spacing)
(global-pangu-spacing-mode t)
;; 默认仅在 emacs 中显示空格不写入文件
;; 设置直接写入文件
(setq pangu-spacing-real-insert-separtor t)

;; htmlize
(require-package 'htmlize)
(require 'htmlize)

;; Key
(global-set-key (kbd "<f1>") 'deft)
(global-set-key (kbd "<f2>") 'whitespace-cleanup)
(global-set-key (kbd "<f3>") 'query-replace)	;; 交互式查找替换
(global-set-key (kbd "<f4>") 'replace-regexp)	;; 立刻替换指定文字

;; chinese-pinyin
(require-package 'chinese-pyim)
(require 'chinese-pyim)
(setq default-input-method "chinese-pyim")
(global-set-key (kbd "C-\\") 'toggle-input-method)
;; 使用 popup 包来绘制选词框
(setq pyim-use-tooltip 'popup)
;;Linux 平台下，emacs 可以使用 GTK 来绘制选词框
;(setq pyim-use-tooltip 'pos-tip)
;(setq x-gtk-use-system-tooltips t)
;; 选词框单行显示
(setq pyim-guidance-format-function 'pyim-guidance-format-function-one-line)

(provide 'init-editor)
