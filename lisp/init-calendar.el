(require 'calendar)
(setq calendar-latitude +30.15)
(setq calendar-longitude +120.10)
(setq calendar-location-name "Shanghai, China")
;; display chinese holidays
(setq calendar-chinese-all-holidays-flag t)
;; by default show all holidays
(setq calendar-mark-holidays-flag t)
;; 设置 calendar 的显示
(setq calendar-remove-frame-by-deleting t)
(setq calendar-week-start-day 1)            ; 设置星期一为每周的第一天
(setq mark-diary-entries-in-calendar t)     ; 标记 calendar 上有 diary 的日期
(setq mark-holidays-in-calendar t)   ; 为了突出有 diary 的日期，calendar 上不标记节日
;(setq view-calendar-holidays-initially t) ; 打开 calendar 的时候不显示一堆节日
;; 在每次启动的时候，自动按照 diary 中的记录进行提醒
;(appt-activate 1)

;; Calendar
(global-set-key (kbd "C-c C-d") 'calendar)
;; 设置阴历显示，在 calendar 上用 pC 显示阴历
(setq chinese-calendar-celestial-stem
  ["甲" "乙" "丙" "丁" "戊" "己" "庚" "辛" "壬" "癸"])
(setq chinese-calendar-terrestrial-branch
  ["子" "丑" "寅" "卯" "辰" "巳" "戊" "未" "申" "酉" "戌" "亥"])
;; 设置 calendar 的显示
(setq calendar-remove-frame-by-deleting t)
(setq calendar-week-start-day 1)            
; 设置星期一为每周的第一天
(setq mark-diary-entries-in-calendar t)     
; 标记 calendar 上有 diary 的日期
(setq mark-holidays-in-calendar nil)        
; 为了突出有 diary 的日期，calendar 上不标记节日
(setq view-calendar-holidays-initially nil) 
; 打开 calendar 的时候不显示一堆节日 
;; 去掉不关心的节日，设定自己在意的节日，在 calendar 上用 h 显示节日
(setq christian-holidays nil)
(setq hebrew-holidays nil)
(setq islamic-holidays nil)
(setq solar-holidays nil)
(setq general-holidays '(
(holiday-fixed 1 1 "元旦")
(holiday-fixed 2 14 "情人节")
(holiday-fixed 3 14 "白色情人节")
(holiday-fixed 4 1 "愚人节")
(holiday-fixed 5 1 "劳动节")
(holiday-float 5 0 2 "母亲节")
(holiday-fixed 6 1 "儿童节")
(holiday-float 6 0 3 "父亲节")
(holiday-fixed 7 1 "建党节")
(holiday-fixed 8 1 "建军节")
(holiday-fixed 9 10 "教师节")
(holiday-fixed 10 1 "国庆节")
(holiday-fixed 11 11 "mudan 生日")
(holiday-fixed 12 25 "圣诞节")))

;; Diary
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(display-time-mode 1)
;(setq todo-file-do (concat GTD-HOME-PATH "todo/do"))
;(setq todo-file-done (concat GTD-HOME-PATH "todo/done"))
;(setq todo-file-top (concat GTD-HOME-PATH "todo/top"))
;(setq diary-file (concat GTD-HOME-PATH "diary"))
(setq diary-file "D:/MEGA/note/diary")
(setq diary-mail-addr "mudand88@gmail.com")
(add-hook 'diary-hook 'appt-make-list)
(setq calendar-date-style 'iso)

;; appointment
;; appt-add 加入新的提醒，appt-delete 删掉提醒
(appt-activate 1)                       ;开启提醒 appointment 功能
(setq appt-audible t)                   ;开启 appointment 的声音提醒
(setq appt-display-mode-line t)         ;在 mode-line 上显示 appointment 的倒计时
(add-hook 'diary-hook 'appt-make-list)
(setq appt-issue-message t)

(provide 'init-calendar)
