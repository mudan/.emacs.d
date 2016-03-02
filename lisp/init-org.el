(require-package 'org)
;(require-package 'ox-twbs)	;; https://github.com/marsmining/ox-twbs
		;; org-twbs-export-to-html
;(require 'ox-twbs)
;(require-package 'org-fstree)

;(require-package 'org-crypt)   ; 需启动 EasyPG 加密指定条目
;(require 'org-crypt)
;(setq org-crypt-tag-matcher "secret")  ; 设定要加密的条目 TAG 标签为 secret
;(org-crypt-use-before-save-magic)      ; 当被加密部分更新存入硬盘时，自动加密回去
;(setq org-tags-exclude-from-inheritance (quote ("secret")))    ; 避免子节点重复加密

;(require-package 'ob-ditaa)            ; 加入 ditaa 支持
;(setq org-ditaa-jar-path (concat emacs-etc-dir "ditaa.jar"))

;(when *is-a-mac*
;  (require-package 'org-mac-link)
;  (autoload 'org-mac-grab-link "org-mac-link" nil t)
;  (require-package 'org-mac-iCal))

(add-hook 'org-mode-hook 'turn-on-font-lock)
(add-hook 'org-mode-hook
(lambda () (setq truncate-lines )))
(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|/TODO\\)$" . org-mode))
(add-to-list 'file-coding-system-alist (cons "\\.\\(org\\|org_archive\\|/TODO\\)$"  'utf-8))

;;global keys
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;; Various preferences
(setq org-log-done t
      org-completion-use-ido t
      org-edit-timestamp-down-means-later t
      org-archive-mark-done nil
      org-catch-invisible-edits 'show
      org-export-coding-system 'utf-8
      org-fast-tag-selection-single-key 'expert
      org-html-validation-link nil
      org-export-kill-product-buffer-when-displayed t
      org-tags-column 80)

;; 大纲模式下省略号改成箭头
;; ▼, ↴, ⬎, ⤷
;(setq org-ellipsis "⤵")
;; 自动缩排模式
(setq org-startup-indented t)
;; 所有项目隐藏，只保留母节点
(setq org-startup-folded t)
;; 在程序码栏为程序上色
(setq org-src-fontify-natively t)
;; 让正文中的 plain list 也能折叠
(setq org-cycle-include-plain-lists t)
;; 高亮显示 code blocks
(setq org-src-fontify-natively t)

;; 重新定义 org-font-lock-ensure
;; 解决 org-html-fontify-code: Wrong number of arguments: #[(_beg _end) "À ‡" [font-lock-fontify-buffer] 1], 0
(defun org-font-lock-ensure ()
  (font-lock-fontify-buffer))

;; 扩充 easy-template
;; 默认按 <e + TAB 可自动补全为
;; #+BEGIN_EXAMPLE
;; #+END_EXAMPLE
;(add-to-list 'org-structure-template-alist
;             '("E" "#+BEGIN_SRC emacs-lisp\n?\n#+END_SRC"))
;             (add-to-list 'org-structure-template-alist
;             '("S" "#+BEGIN_SRC sh\n?\n#+END_SRC"))
;             (add-to-list 'org-structure-template-alist
;             '("p" "#+BEGIN_SRC plantuml :file uml.png \n?\n#+END_SRC"))

;; 设定 org 目录
(setq org-publish-project-alist
      '(("org-notes"
         :base-directory "D:/Dropbox/note/文摘"
         :publishing-directory "D:/Dropbox/note/文摘/public_html/"
         :publishing-function org-twbs-publish-to-html
         :with-sub-superscript nil
         )))
;;(local-set-key (kbd "s-\\") 'my-org-publish-buffer)	;; 在 OSX 下使用 CMD- \

;; agenda
;(setq org-agenda-include-diary t)      ; 将 diary 的事项也纳入 agenda 中显示
(setq org-agenda-compact-blocks t)	; Compact the block agenda view
(setq org-agenda-show-all-dates t)	; 显示所有 Agenda 日期，即使没有任务
(setq org-agenda-text-search-extra-files (quote (agenda-archives))) ; 当搜索文本时,也从归档文件中查找
(setq org-agenda-start-on-weekday 1)	; 星期一开始每周议程
(setq org-agenda-window-setup 'current-window)  ; agenda 显示在当前窗口
;(setq org-agenda-files (list org-directory))    ; angenda 文件从 org 文件夹中寻找
(add-hook 'org-agenda-mode-hook 'hl-line-mode)  ; agenda 启动 hl-line
(setq org-agenda-show-all-dates t)	; C-c C-t 直接选择 TODO 状态

;; 任何未完成的子任务会阻止父任务变为完成状态,若像临时屏蔽该功能,可以为该任务添加`:NOBLOCKING: t'属性
;; 若父任务中设置了属性`:ORDERED: t',则表示其子任务必须依照顺序从上到下完成
(setq org-enforce-todo-dependencies t)

;; TODO 自动更新进度
(defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)   ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))
(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)

;; 任务完成后，自动记录完成时间
(setq org-log-done (quote time))

;; org capture
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "D:/Dropbox/note/todo.org" "Tasks")
         "* TODO %?\n  %i\n  %a")
        ("j" "Journal" entry (file+datetree "D:/Dropbox/note/journal.org")
         "* %?\nEntered on %U\n  %i\n  %a")
        ("n" "Note" entry (file+datetree "D:/Dropbox/note/note.org")
         "* %? :NOTE:\n%U\n%a\n")
        ))
;; C-c t 直接打开 todo.org
(define-key global-map "\C-ct"
   (lambda () (interactive) (org-capture nil "t")))
(define-key global-map "\C-cj"
   (lambda () (interactive) (org-capture nil "j")))
(define-key global-map "\C-cn"
   (lambda () (interactive) (org-capture nil "n")))

;; org-clock 计时功能
(require 'org-clock)
(setq org-clock-persist 'history)
;; Resume clocking task when emacs is restarted
(org-clock-persistence-insinuate)
(setq org-clock-persist t)
;; Resume clocking task on clock-in if the clock is open
(setq org-clock-in-resume t)
;; 设置 clock tracking 的时间到达预估工作量时的提醒声音
(setq org-clock-sound t)
;; Separate drawers for clocking and logs
;; (setq org-drawers (quote ("PROPERTIES" "LOGBOOK")))
;; Save clock data and notes in the LOGBOOK drawer
(setq org-clock-into-drawer t)
;; Save state changes in the LOGBOOK drawer
(setq org-log-into-drawer t)
;; Removes clocked tasks with 0:00 duration
;; Show clock sums as hours and minutes, not "n days" etc.
(setq org-time-clocksum-format
      '(:hours "%d" :require-hours t :minutes ":%02d" :require-minutes t))
(setq org-clock-out-remove-zero-time-clocks t)

;; 可以 refile 到 org-agenda-files 中的文件和当前文件中，最多 9 层
(setq org-refile-targets (quote ((nil :maxlevel . 9)
                                 (org-agenda-files :maxlevel . 9))))
;; Allow refile to create parent tasks with confirmation
(setq org-refile-allow-creating-parent-nodes 'confirm)

;; 存档
(setq org-archive-mark-done nil)
(setq org-archive-location "%s_archive::* Archive")

;(setq org-html-inline-images t)		;; 导出 html 时,嵌入图片,而不是创建图片的链接
;; M-x org-toggle-inline-images	直接在 org 文件中显示图片
(setq org-image-actual-width t)			;; org 文件中显示的图片为原始大小
;; 尋找你額外進行的 #+ATTR.* 設定，若尋找失敗的話，則會變成使用你的寬度設定
;; #+CAPTION: 設定圖片寬度為 100
;; #+ATTR_HTML: :width 100
;(setq org-image-actual-width '(300))

;; icalendar
(autoload 'icalendar-import-buffer "icalendar" "Import iCalendar data from current buffer" t)

;; 设定 babel 支援的语言
;; C-c C-c 选定程序码块进行运算
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (C . t)
   (ditaa . t)
   (dot . t)
   (js . t)
   (latex . t)
   (perl . t)
   (python . t)
   (ruby . t)
   (sh . t)
   (plantuml . t)
   (clojure .t)
   ))
;; C-c C-c 不再询问是否进行运算，直接开始
(setq org-confirm-babel-evaluate nil)

;; 新增 org 文件时插入模版
(defun new-org-file-init ()
  "init new org file template"
  (interactive)
  (when (equal "org" (file-name-extension buffer-file-name))
    (insert (concat "#+TITLE: "(file-name-base buffer-file-name)) "\n")
    (insert "#+AUTHOR: " user-login-name "\n")
    (insert "#+CATEGORY: "  (get-category-from-path buffer-file-name)"\n")
    (insert "#+DATE: " (format-time-string "[%Y-%m-%d %a %H:%M]" (current-time)) "\n")
    (insert "#+OPTIONS: ^:{}")))
(add-to-list 'find-file-not-found-hooks 'new-org-file-init)

;; 去除导出 HTML 时多余的空格
(defadvice org-html-paragraph (before org-html-paragraph-advice
                                      (paragraph contents info) activate)
  "Join consecutive Chinese lines into a single long line without
unwanted space when exporting org-mode to html."
  (let* ((origin-contents (ad-get-arg 1))
         (fix-regexp "[[:multibyte:]]")
         (fixed-contents
          (replace-regexp-in-string
           (concat
            "\\(" fix-regexp "\\) *\n *\\(" fix-regexp "\\)") "\\1\\2" origin-contents)))
    (ad-set-arg 1 fixed-contents)))

;; M-x gtd 在新的窗口中打开了 GTD.org
; (defun gtd ()
;   (interactive)
;   (find-file "~/GTD.org")
; )

(provide 'init-org)
