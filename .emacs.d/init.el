(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 4))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
	(url-retrieve-synchronously
	 "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
	 'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(package-initialize)
(straight-use-package 'use-package)
(setq straight-use-package-by-default t)

					; packages
(use-package evil)
(use-package evil-surround)
(use-package labburn-theme)
(use-package company)
(use-package racket-mode)
(use-package helm)
(use-package helm-ls-git)
(use-package which-key)
(use-package haskell-mode)
(use-package intero)
(use-package editorconfig)

; enable all things
(evil-mode 1)
(global-evil-surround-mode 1)
(global-company-mode t)
(helm-mode 1)
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode t)
(which-key-mode)
(intero-global-mode 1)
(editorconfig-mode 1)
; (add-hook 'haskell-mode-hook 'intero-mode)

(setq haskell-stylish-on-save t)
(setq tab-width 2)
(setq c-default-style "linux"
      c-basic-offset 8)

(global-set-key (kbd "C-SPC")			'helm-M-x)
(global-set-key (kbd "C-a")			'align-regexp)

(define-key evil-motion-state-map (kbd "l") 'evil-find-char-to)
(define-key evil-motion-state-map (kbd "L") 'evil-find-char-to-backward)
(define-key evil-motion-state-map (kbd "k") 'evil-search-next)
(define-key evil-motion-state-map (kbd "K") 'evil-search-previous)

(define-key evil-visual-state-map (kbd "L")	'evil-surround-region)
(define-key evil-visual-state-map (kbd "H")	'evil-first-non-blank)
(define-key evil-visual-state-map (kbd "S")	'evil-end-of-line)

(define-key evil-normal-state-map (kbd "H")	'evil-first-non-blank)
(define-key evil-normal-state-map (kbd "S")	'evil-end-of-line)

(define-key evil-motion-state-map (kbd "C-f")   'helm-ls-git-ls)
(define-key evil-insert-state-map (kbd "C-c")	'evil-force-normal-state)

(define-key evil-motion-state-map (kbd "C-e")
  (lambda () (interactive) (evil-scroll-down 0)))
(define-key evil-motion-state-map (kbd "C-u")
  (lambda () (interactive) (evil-scroll-up 0)))
(define-key evil-normal-state-map (kbd "C-p")	'helm-mini)

(global-set-key (kbd "C-S-N")			'evil-window-up)
(global-set-key (kbd "C-S-T")			'evil-window-down)
(global-set-key (kbd "C-S-H")			'evil-window-left)
(global-set-key (kbd "C-S-S")			'evil-window-right)

(define-key evil-normal-state-map (kbd "C-|")	'split-window-horizontally)
(define-key evil-normal-state-map (kbd "C-\-")	'split-window-vertically)

; (define-key evil-visual-state-map "s"		'evil-substitute)
; (define-key evil-visual-state-map "S"		'evil-surround-region)
(define-key evil-visual-state-map "h"		'evil-backward-char)
(define-key evil-visual-state-map "t"		'evil-next-line)
(define-key evil-visual-state-map "n"		'evil-previous-line)
(define-key evil-visual-state-map "s"		'evil-forward-char)

(define-key evil-normal-state-map (kbd "h")	'backward-char)
(define-key evil-normal-state-map (kbd "t")	'evil-next-line)
(define-key evil-normal-state-map (kbd "n")	'previous-line)
(define-key evil-normal-state-map (kbd "s")	'forward-char)

(define-key evil-normal-state-map (kbd "<return>")
  (lambda () (interactive)
    (evil-open-below 1)
    (evil-force-normal-state)
    (evil-previous-line 1)))

(define-key evil-normal-state-map (kbd "S-<return>")
  (lambda () (interactive)
    (evil-open-above 1)
    (evil-force-normal-state)
    (evil-next-line 1)))

(define-key evil-normal-state-map
  "T" #'(lambda () (interactive)
          "join this line at the end of the line below"
          (join-line 1)))

(setq visible-bell 1)
(setq inhibit-startup-screen t)
(setq jit-lock-defer-time 0)
(setq fast-but-imprecise-scrolling t)

(setq scroll-conservatively 10)
(setq scroll-margin 7)

(set-frame-font "Hasklig-16" nil t)
(tool-bar-mode -1)
(setq tab-always-indent 'complete)