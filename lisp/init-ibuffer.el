(require-package 'fullframe)
(after-load 'ibuffer
  (fullframe ibuffer ibuffer-quit))

;; 基本设置
(setq ibuffer-always-compile-formats         t )
(setq ibuffer-default-shrink-to-minimum-size t )
(setq ibuffer-expert                         t )
(setq ibuffer-show-empty-filter-groups     nil )
(setq ibuffer-use-other-window             nil )
(setq ibuffer-always-show-last-buffer      nil )

(after-load 'ibuffer
;; Use human readable Size column instead of original one
(define-ibuffer-column size-h
  (:name "Size" :inline t)
  (cond
   ((> (buffer-size) 1000000) (format "%7.1fM" (/ (buffer-size) 1000000.0)))
   ((> (buffer-size) 1000) (format "%7.1fk" (/ (buffer-size) 1000.0)))
   (t (format "%8d" (buffer-size))))))

(setq ibuffer-filter-group-name-face 'font-lock-doc-face)

(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)

;; 退出后关闭 ibuffer
(defadvice ibuffer-quit (after kill-ibuffer activate)
  "Kill the ibuffer buffer on exit."
  (kill-buffer "*Ibuffer*"))

;; 自动排列档案名称
(add-hook 'ibuffer-mode-hook 'ibuffer-do-sort-by-filename/process)

;; 格式
(setq ibuffer-formats
      '((     (name 23 23 :left :elide)
              " "
              (size-h 9 -1 :right)
              "  "
              (mode 16 16 :left :elide)
              " "
              filename-and-process)))

;; 分组
(setq ibuffer-saved-filter-groups
      (quote (("default"
               ("dired" (mode . dired-mode))
               ("perl" (mode . cperl-mode))
               ("erc" (mode . erc-mode))
               ("org" (mode . org-mode))
               ("planner" (or
                           (name . "^\\*Calendar\\*$")
                           (name . "^diary$")
                           (mode . muse-mode)))
               ("emacs" (or
                         (name . "^\\*GNU Emacs\\*$")
                         (name . "^\\*scratch\\*$")
                         (name . "^\\*Messages\\*$")))
               ("gnus" (or
                        (mode . message-mode)
                        (mode . bbdb-mode)
                        (mode . mail-mode)
                        (mode . gnus-group-mode)
                        (mode . gnus-summary-mode)
                        (mode . gnus-article-mode)
                        (name . "^\\.bbdb$")
                        (name . "^\\.newsrc-dribble")))))))

(provide 'init-ibuffer)
