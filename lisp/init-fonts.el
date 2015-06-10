;; 系统编码
(prefer-coding-system 'utf-8 )
;; 语言环境
(set-language-environment 'utf-8 )
;; 文件保存时的编码
(set-buffer-file-coding-system 'utf-8 )
;; 读写缓冲区编码
(setq coding-system-for-read 'utf-8)
(setq coding-system-for-write 'utf-8)

(setq list-faces-sample-text
      (concat
       "ABCDEFTHIJKLMNOPQRSTUVWXYZ abcdefghijklmnopqrstuvwxyz\n"
       "11223344556677889900       壹貳參肆伍陸柒捌玖零"))

;; 设置中英文字体
(create-fontset-from-fontset-spec
 "-unknown-Monaco-normal-normal-normal-*-13-*-*-*-m-0-fontset-myfontset")
(set-fontset-font "fontset-myfontset" 'han "微软雅黑")
(add-to-list 'default-frame-alist '(font . "fontset-myfontset"))

;; 显示特殊符号
(set-fontset-font t 'unicode "Symbola" nil 'append)
(set-fontset-font t 'unicode "Segoe UI Emoji" nil 'append)
(set-fontset-font t 'unicode "STIX" nil 'prepend)

(provide 'init-fonts)
