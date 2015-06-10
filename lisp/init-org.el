(require-package 'org)
(require-package 'org-fstree)

;(require-package 'org-crypt)   ; 需启动 EasyPG 加密指定条目
;(setq org-crypt-tag-matcher "secret")  ; 设定要加密的条目 TAG 标签为 secret
;(org-crypt-use-before-save-magic)      ; 当被加密部分更新存入硬盘时，自动加密回去
;(setq org-tags-exclude-from-inheritance (quote ("secret")))    ; 避免子节点重复加密

;(require-package 'ob-ditaa)            ; 加入 ditaa 支持
;(setq org-ditaa-jar-path (concat emacs-etc-dir "ditaa.jar"))

(when *is-a-mac*
  (require-package 'org-mac-link)
  (autoload 'org-mac-grab-link "org-mac-link" nil t)
  (require-package 'org-mac-iCal))

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

;; 自动缩排模式
(setq org-startup-indented t)
;; 所有项目隐藏，只保留母节点
(setq org-startup-folded t)
;; 在程序码栏为程序上色
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

;; org 文件夹
(setq org-directory (concat "D:/Dropbox/note"))

;; agenda
;(setq org-agenda-include-diary t)      ; 将diary的事项也纳入agenda中显示
(setq org-agenda-text-search-extra-files (quote (agenda-archives))) ; 当搜索文本时,也从归档文件中查找
(setq org-agenda-start-on-weekday 1)	; 星期一开始每周议程
(setq org-agenda-window-setup 'current-window)  ; agenda 显示在当前窗口
(setq org-agenda-files (list org-directory))    ; angenda 文件从 org 文件夹中寻找
(add-hook 'org-agenda-mode-hook 'hl-line-mode)  ; agenda 启动 hl-line

;; TODO 自动更新进度
(defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)   ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))
(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)

;; org capture
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "D:/Dropbox/todo.org" "Tasks")
         "* TODO %?\n  %i\n  %a")
        ("j" "Journal" entry (file+datetree "D:/Dropbox/journal.org")
             "* %?\nEntered on %U\n  %i\n  %a")
        ("n" "Note" entry (file+datetree "D:/Dropbox/note.org")
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
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)
(setq org-clock-persist t)
(setq org-clock-in-resume t)
;; Save clock data and notes in the LOGBOOK drawer
(setq org-clock-into-drawer t)
;; Save state changes in the LOGBOOK drawer
(setq org-log-into-drawer t)
;; Removes clocked tasks with 0:00 duration
;; Show clock sums as hours and minutes, not "n days" etc.
(setq org-time-clocksum-format
      '(:hours "%d" :require-hours t :minutes ":%02d" :require-minutes t))
(setq org-clock-out-remove-zero-time-clocks t)

;; 存档
(setq org-archive-mark-done nil)
(setq org-archive-location "%s_archive::* Archive")

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
;; 不再询问是否进行运算，直接开始
(setq org-confirm-babel-evaluate nil)

;; M-x gtd 在新的窗口中打开了 GTD.org
; (defun gtd ()
;   (interactive)
;   (find-file "~/GTD.org")
; )

(provide 'init-org)
