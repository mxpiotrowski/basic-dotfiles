(setq inhibit-startup-screen t)

(when (eq system-type 'darwin)
  (setq ns-alternate-modifier 'none  ; Option key
	ns-command-modifier   'meta) ; Command key

  ;; If C-right and C-left are not passed to Emacs, check System
  ;; Preferences, Keyboard, Shortcuts; they may be assigned to Mission
  ;; Control.

  ;; Emacs gets AppleLocale (defaults read -g AppleLocale), which may
  ;; not be the same as LANG and may not be a POSIX locale (locale -a)
  ;; at all.
  (set-locale-environment
   (setenv "LANG" "en_US.UTF-8"))
  
  ;; Don't use a separate frame for the Ediff Control Buffer; it gets
  ;; positioned off screen on Mac OS X
  (setq ediff-window-setup-function 'ediff-setup-windows-plain))

;;; Packages (live below ~/.emacs.d)
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)

;;; Basic key bindings
(global-set-key [(control tab)]           'other-window)
(global-set-key [(control x) (control b)] 'electric-buffer-list)
(global-set-key [(home)]                  'beginning-of-buffer)
(global-set-key [(end)]                   'end-of-buffer)
(global-set-key [(backtab)]               'back-to-indentation)

;; Don't run `view-echo-area-messages' when clicking on the echo area
(define-key minibuffer-inactive-mode-map [mouse-1] #'ignore)

;;; General settings
(blink-cursor-mode 0)     ; Disable blinking cursor
(set-cursor-color "red3") ; Cursor color
(tool-bar-mode 0)         ; Hide tool bar
(pending-delete-mode 1)   ; Typed text replaces active selection
(show-paren-mode 1)       ; Highlight matching parentheses
(auto-compression-mode t) ; Handle gzipped files transparently

(setq track-eol              t
      line-number-mode       t
      column-number-mode     t
      next-line-add-newlines nil
      kill-whole-line        t)

;;; Save minibuffer history
(require 'savehist)
(savehist-mode 1)

;;; re-builder: use string syntax by default
(setq reb-re-syntax 'string)
