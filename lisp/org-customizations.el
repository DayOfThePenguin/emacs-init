;;;
;;; ORG MODE Configuration
;;;
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)

;; Attempt to make text wrap in org
(visual-line-mode t)
