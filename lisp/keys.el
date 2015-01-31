;;;
;;; Adds personal keybindings
;;;

;; TOGGLE COMMENT (binds comment toggle to C-x C-a)
;;
;; Will comment either an entire line or a selected region
(defun comment-or-uncomment-region-or-line ()
  "Comments or uncomments the region or the current line if there's no active region."
  (interactive)
  (let (beg end)
    (if (region-active-p)
	(setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end (line-end-position)))
    (comment-or-uncomment-region beg end)))
(global-set-key (kbd "C-x C-a") 'comment-or-uncomment-region-or-line)

;;; end keys.el
