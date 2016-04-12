;; Haskell mode
;; custom variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-PDF-mode t)
 '(delete-selection-mode t)
 '(ergoemacs-mode t)
 '(haskell-mode-hook (quote (turn-on-haskell-indent turn-on-haskell-doc interactive-haskell-mode)))
 '(org-CUA-compatible nil)
 '(org-replace-disputed-keys nil)
 '(recentf-mode t)
 '(shift-select-mode nil))

;; Haskel-mode YAY ;;;;;;;;;;;;;;;

;; autocomplete
(require 'ac-haskell-process) ; if not installed via package.el
(add-hook 'interactive-haskell-mode-hook 'ac-haskell-process-setup)
(add-hook 'haskell-interactive-mode-hook 'ac-haskell-process-setup)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'haskell-interactive-mode))

(defun set-auto-complete-as-completion-at-point-function ()
  (add-to-list 'completion-at-point-functions 'auto-complete))
(add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)
(add-to-list 'ac-modes 'haskell-interactive-mode)
(add-hook 'haskell-interactive-mode-hook 'set-auto-complete-as-completion-at-point-function)
(add-hook 'haskell-mode-hook 'set-auto-complete-as-completion-at-point-function)


;; more autocomplete
(defun set-auto-complete-as-completion-at-point-function ()
  (add-to-list 'completion-at-point-functions 'auto-complete))
(add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)
(add-to-list 'ac-modes 'haskell-interactive-mode)
(add-hook 'haskell-interactive-mode-hook 'set-auto-complete-as-completion-at-point-function)
(add-hook 'haskell-mode-hook 'set-auto-complete-as-completion-at-point-function)

;; pop up documentation
(eval-after-load 'haskell-mode
  '(define-key haskell-mode-map (kbd "C-c C-d") 'ac-haskell-process-popup-doc))

;; indentation mode
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(add-hook 'haskell-mode-hook 'structured-haskell-mode)
;; aligning code
(global-set-key (kbd "C-x a r") 'align-regexp)

;; Non interactive commands
(eval-after-load 'haskell-mode
  '(define-key haskell-mode-map [f8] 'haskell-navigate-imports))

;; Hashtags (M-.)
(let ((my-cabal-path (expand-file-name "~/.cabal/bin")))
  (setenv "PATH" (concat my-cabal-path ":" (getenv "PATH")))
  (add-to-list 'exec-path my-cabal-path))
(custom-set-variables '(haskell-tags-on-save t))

;; Interactive commands
(custom-set-variables
  '(haskell-process-suggest-remove-import-lines t)
  '(haskell-process-auto-import-loaded-modules t)
  '(haskell-process-log t))
(eval-after-load 'haskell-mode '(progn
  (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
  (define-key haskell-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
  (define-key haskell-mode-map (kbd "C-c C-n C-t") 'haskell-process-do-type)
  (define-key haskell-mode-map (kbd "C-c C-n C-i") 'haskell-process-do-info)
  (define-key haskell-mode-map (kbd "C-c C-n C-c") 'haskell-process-cabal-build)
  (define-key haskell-mode-map (kbd "C-c C-n c") 'haskell-process-cabal)
  (define-key haskell-mode-map (kbd "SPC") 'haskell-mode-contextual-space)))
(eval-after-load 'haskell-cabal '(progn
  (define-key haskell-cabal-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
  (define-key haskell-cabal-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
  (define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
  (define-key haskell-cabal-mode-map (kbd "C-c c") 'haskell-process-cabal)))

(custom-set-variables '(haskell-process-type 'cabal-repl))

;; ghc-mod
;;(let ((my-cabal-path (expand-file-name "~/.cabal/bin")))
;;  (setenv "PATH" (concat my-cabal-path ":" (getenv "PATH")))
;;  (add-to-list 'exec-path my-cabal-path))
;;     no furula :(
;;(autoload 'ghc-init "ghc" nil t)
;;(autoload 'ghc-debug "ghc" nil t)
;;(add-hook 'haskell-mode-hook (lambda () (ghc-init)))

;; end haskell mode YAY ;;;;;;;;;;;;;;;;;;;;;
