;;;; always show line numbers
(setq linum-format "%d ")
(global-linum-mode 1)

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
