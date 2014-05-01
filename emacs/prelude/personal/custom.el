(prelude-require-package 'xquery-mode)

;; xquery mode
(require 'xquery-mode)
(autoload 'xquery-mode "xquery-mode" "XQuery mode" t )
(setq auto-mode-alist
      (append '(("\\.xqy$" . xquery-mode)) auto-mode-alist))

(add-to-list 'default-frame-alist '(font . "Source Code Pro 12"))

;; battery mode
(display-battery-mode 1)

;; ox-reveal for revealjs presentations
(require 'ox-reveal)
