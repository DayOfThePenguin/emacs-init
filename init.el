;;; loads all the needed lisp files
(require 'cl)
;; LOAD FILES
;;
;; *** emacs-root must be changed depending on the system
;; being used ***
;;
;; this approach to loading is borrowed from
;; https://sites.google.com/site/steveyegge2/my-dot-emacs-file

;; all my emacs-related stuff is under ~/.emacs.d
(defvar emacs-root "/afs/crc.nd.edu/user/c/cdablain/")

;; add all the elisp directories under ~/.emacs.d to my load path
(labels ((add-path (p)
		   (add-to-list 'load-path
				(concat emacs-root p))))
  (add-path ".emacs.d/lisp") ; personal lisp code
  (add-path ".emacs.d/themes") ; different themes that I use
  (add-path ".emacs.d/net") ; useful lisp found on the interwebs
  )

(load-library "keys") ; personal keybindings
(load-library "lush-theme") ; sets my favorite theme
(load-library "customizations") ; global customizations
(load-library "org-customizations") ; org mode customizations
(load-library "fill-column-indicator")
;; (load-library "smart-tabs-mode")

;;
;; Fill-column
;;
(require 'fill-column-indicator) ; half-assed solution to make it work
; in the short-term.
(add-hook 'emacs-lisp-mode-hook (lambda ()
				  (fci-mode 1)
				  ))

;;
;; Indent with 4 spaces
;;
(setq-default indent-tabs-mode nil) ; indents with spaces instead of tabs
(setq tab-stop-list (number-sequence 4 120 4))
(setq tab-width 4) ; the default width to display a file with tabs in it

;;
;; Smart-tabs
;;
;; (autoload 'smart-tabs-mode "smart-tabs-mode"
;;   "Intelligently indent with tabs, align with spaces!")
;; (autoload 'smart-tabs-mode-enable "smart-tabs-mode")
;; (autoload 'smart-tabs-advice "smart-tabs-mode")
;; (autoload 'smart-tabs-insinuate "smart-tabs-mode")

;; (smart-tabs-insinuate 'c 'c++ 'java 'javascript 'cperl 'python 'ruby 'nxml)
;; ;; languages to use smart-tab-mode for

;; ;; hopfully fixes python indent problems...seems to be working
;; (add-hook 'python-mode-hook
;; 	  (lambda ()
;; 	    (setq tab-width 4)
;; 	    (fci-mode 1)
;; 	            (setq python-indent 4)))

;; sets the temporary file directory to the system's temp directory
(setq backup-directory-alist
          `((".*" . ,temporary-file-directory)))
    (setq auto-save-file-name-transforms
          `((".*" ,temporary-file-directory t)))
;; make things wrap
(global-visual-line-mode t)
