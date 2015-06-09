;;设置中英文字体
(create-fontset-from-fontset-spec
 "-unknown-Monaco-normal-normal-normal-*-13-*-*-*-m-0-fontset-myfontset")
(set-fontset-font "fontset-myfontset" 'han "微软雅黑")
(add-to-list 'default-frame-alist '(font . "fontset-myfontset"))

(provide 'init-fonts)
