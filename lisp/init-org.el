(require-package 'org)
(require-package 'org-fstree)
(when *is-a-mac*
  (require-package 'org-mac-link)
  (autoload 'org-mac-grab-link "org-mac-link" nil t)
  (require-package 'org-mac-iCal))

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

;; agenda
;(setq org-agenda-include-diary t)      ; 将diary的事项也纳入agenda中显示
(setq org-agenda-text-search-extra-files (quote (agenda-archives))) ; 当搜索文本时,也从归档文件中查找
(setq org-agenda-start-on-weekday 1)	; 星期一开始每周议程

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

;; M-x gtd 在新的窗口中打开了 GTD.org
; (defun gtd ()
;   (interactive)
;   (find-file "~/GTD.org")
; )

(provide 'init-org)
