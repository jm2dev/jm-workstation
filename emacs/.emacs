;;;; always show line numbers
(setq linum-format "%d ")
(global-linum-mode 1)

;;;; Fix junk characters in shell mode
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; http://homepages.inf.ed.ac.uk/s0243221/emacs/
;; ===== Set the highlight current line minor mode =====

;; In every buffer, the line which contains the cursor will be fully
;; highlighted
(global-hl-line-mode 1)

;; ===== Set standard indent to 2 rather that 4 ====
(setq standard-indent 4)

;; ===== Turn off tab character =====

;;
;; Emacs normally uses both tabs and spaces to indent lines. If you
;; prefer, all indentation can be made from spaces only. To request this,
;; set `indent-tabs-mode' to `nil'. This is a per-buffer variable;
;; altering the variable affects only the current buffer, but it can be
;; disabled for all buffers.

;;
;; Use (setq ...) to set value locally to a buffer
;; Use (setq-default ...) to set value globally
;;
(setq-default indent-tabs-mode nil) 

;; ========== Place Backup Files in Specific Directory ==========

;; Enable backup files.
(setq make-backup-files t)

;; Enable versioning with default values (keep five last versions, I think!)
(setq version-control t)

;; Save all backup file in this directory.
(setq backup-directory-alist (quote ((".*" . "~/.emacs_backups/"))))

;; ========== Enable Line and Column Numbering ==========

;; Show line-number in the mode line
(line-number-mode 1)

;; Show column-number in the mode line
(column-number-mode 1)

;;; nxml-mode
;;; enter nxml-mode whenever opening a file with any of this suffixes
(setq auto-mode-alist
	(append (list
			'("\\.xml" . nxml-mode)
			'("\\.xsl" . nxml-mode)
			'("\\.xql" . nxml-mode)
			'("\\.xsd" . nxml-mode)
			'("\\.xhtml" . nxml-mode)
			'("\\.xslt" . nxml-mode))
	auto-mode-alist))

(add-hook 'nxml-mode-hook' 'turn-on-auto-fill)

;;; groovy mode
(load "/usr/home/jm2dev/.emacs.d/site-lisp/groovy-mode.el")
(load "/usr/home/jm2dev/.emacs.d/site-lisp/groovy-electric.el")

;;; tunn syntax hilighting
(global-font-lock-mode 1)

;;; use groovy-mode when file ends in .groovy or has #!/usr/local/bin/groovy at start
(autoload 'groovy-mode "groovy-mode" "Groovy editing mode." t)
(add-to-list 'auto-mode-alist '("\.groovy$" . groovy-mode))
(add-to-list 'interpreter-mode-alist '("groovy" . groovy-mode))

;;; make Groovy mode electric by default.
(add-hook 'groovy-mode-hook
          '(lambda ()
             (require 'groovy-electric)
             (groovy-electric-mode)))

;;; grails mode
(load "/usr/home/jm/.emacs.d/site-lisp/levenshtein.el")
(load "/usr/home/jm/.emacs.d/site-lisp/project-mode.el")
(load "/usr/home/jm/.emacs.d/site-lisp/grails-mode.el")

(require 'grails-mode)
(setq grails-mode t)
(setq project-mode t)
;;; use whatever mode you want for views.
(add-to-list 'auto-mode-alist '("\.gsp$" . nxml-mode)) 
;;; loads all saved projects. Recommended, but not required.
(require 'project-mode)
(project-load-all) 
