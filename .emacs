;;; package --- Summary 
;; company
;; company-c-headers
;; cmake-ide (MUST BE FROM melpa-stable!)
;; yansippet
;; srefactor
;; neotree
;; shell-pop
;; multiple-cursors


;; start emacs maximized
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; make [home] key go to beginning of line smartly ignoring any indentation
(defun my-smart-beginning-of-line ()
  "Move point to beginning-of-line. If repeat command it cycle
position between `back-to-indentation' and `beginning-of-line'."
  (interactive "^")
  (if (and (eq last-command 'my-smart-beginning-of-line)
           (= (line-beginning-position) (point)))
      (back-to-indentation)
    (beginning-of-line)))

(global-set-key [home]     'my-smart-beginning-of-line)

;; turn off annoying bell!
(setq ring-bell-function 'ignore)

; set c/c++ code style
(setq c-default-style "java"
      c-basic-offset 4)

;; turn on line numbers by default
(global-linum-mode t)

;; highlight current line
(global-hl-line-mode 1)
(set-face-background 'hl-line "#282B2C")
(set-face-foreground 'highlight nil)
(set-face-underline-p 'highlight nil)

; show matching parens
(show-paren-mode 1)

;; auto close bracket insertion
(electric-pair-mode 1)

;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(3 ((shift) . 3)))	;; one line at a time    
(setq mouse-wheel-progressive-speed nil)		;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't)			;; scroll window under mouse
(setq scroll-step 1)					;; keyboard scroll one line at a time
(setq scroll-conservatively 10000)
(setq auto-window-vscroll nil)



;;---------------------------------
;; Package related configuration
;;---------------------------------


;; enable package management and add melpa repo
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; enable projectile
(projectile-global-mode)

;; enable company
(require 'company)
;; enable company-c-headers
(add-to-list 'company-backends 'company-c-headers)
(add-to-list 'company-backends '(company-clang company-semantic))
(add-hook 'after-init-hook 'global-company-mode)

;; enable flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

;; enable cmake-ide (MUST BE A STABLE VERSION!!! IMPORTANT! written using v0.3)
(cmake-ide-setup)

;; enable semantic mode and semantic refactor
(require 'srefactor)
(require 'srefactor-lisp)
(semantic-mode 1)

;; set some keybindings for semantic refactor
(define-key c-mode-map (kbd "M-RET") 'srefactor-refactor-at-point)
(define-key c++-mode-map (kbd "M-RET") 'srefactor-refactor-at-point)
(global-set-key (kbd "M-RET o") 'srefactor-lisp-one-line)
(global-set-key (kbd "M-RET m") 'srefactor-lisp-format-sexp)
(global-set-key (kbd "M-RET d") 'srefactor-lisp-format-defun)
(global-set-key (kbd "M-RET b") 'srefactor-lisp-format-buffer)

;; enable neotree and auto start it on launch
(require 'neotree)
(add-hook 'after-init-hook 'neotree)

;; enable yasnippet
(require 'yasnippet)
(yas-global-mode 1)

;; enable Shell Pop
(require 'shell-pop)
(global-set-key "\C-t" 'shell-pop)

;; enable multiple-cursors
(require 'multiple-cursors)
;; bind  S-space to start marking rectangle region
(global-set-key (kbd "C-SPC") 'set-rectangular-region-anchor)
;; rebind M--SHIFT-mouse1 to add cursor on click
(global-set-key (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "unknown" :slant normal :weight normal :height 90 :width normal)))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cua-mode t nil (cua-base))
 '(custom-enabled-themes (quote (solarized-dark)))
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(safe-local-variable-values
   (quote
    ((cmake-ide-dir . "/home/hunter522/Development/cpp/test-cmake-cpp5/build")
     (cmake-ide-dir . "/home/hunter522/Development/cpp/test-cmake-cpp4/build")
     (cmake-ide-dir . "/home/hunter522/Development/cpp/test-cmake-cpp3/build")
     (cmake-ide-dir . "/home/hunter522/Development/cpp/test-cmake-cpp2/build")
     (cmake-ide-dir . "/home/hunter522/Development/cpp/test-cmake-cpp/build"))))
 '(show-paren-mode t))

