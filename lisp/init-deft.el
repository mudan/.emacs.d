(require-package 'deft)
(require 'deft)

(setq deft-extension "org")
(setq deft-text-mode 'org-mode)
;(setq deft-text-mode 'markdown-mode)
(setq deft-use-filename-as-title t)
(setq deft-directory "~/MEGA/note/deft")

;(defun sk/deft-org ()
;  "Uses the sk/deft function to search in the default org directory"
;  (interactive)
;  (sk/deft "~/MEGA/org"))
;(defun sk/deft-blog ()
;  "Uses the sk/deft function to search in the blog posts directory"
;  (interactive)
;  (sk/deft "~/MEGA/org/blogposts/posts"))
;(bind-keys*
;  ("C-z o f" . sk/deft-org)
;  ("C-z o F" . sk/deft-blog))


(provide 'init-deft)
