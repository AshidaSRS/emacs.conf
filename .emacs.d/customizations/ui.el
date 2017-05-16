;; Full bell diable
(setq ring-bell-function 'ignore)

;;Auto Fill mode
(add-hook 'text-mode-hook 'auto-fill-mode)

;; Hide menu-bar
(menu-bar-mode -1)

;; Hide scroll
(scroll-bar-mode -1)

;;Line number
(global-linum-mode t)

;; Hide tool bar
(tool-bar-mode -1)

;; distinguished theme
;;(load-theme 'distinguished t)

;;moe-theme
;(require 'moe-theme)
;(moe-dark)
;(load-theme 'subdued t)
;; (require 'setup-theme)
;; (set-linum)
;; (set-full-paren)
;; (set-sanityinc)

;; Tamaño de letra
(set-face-attribute 'default nil :height 100)

;; kill BUFFERS
(require 'clean_buffers)

;; In every buffer, the line which contains the cursor will be fully
;; highlighted
(global-hl-line-mode 1)

;; Parenthesis mode
(show-paren-mode 1)

(global-set-key (kbd "M-S-<left>") 'windmove-left)
(global-set-key (kbd "M-S-<right>") 'windmove-right)
(global-set-key (kbd "M-S-<up>") 'windmove-up)
(global-set-key (kbd "M-S-<down>") 'windmove-down)

(global-set-key (kbd "M-s-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "M-s-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "M-s-<down>") 'shrink-window)
(global-set-key (kbd "M-s-<up>") 'enlarge-window)

;; utf-8 powaa!!
(set-language-environment 'utf-8)
(prefer-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(set-input-method nil)
;; no annoying blinking cursor
(blink-cursor-mode -1)

;; automatically indent wherever I am
(global-set-key (kbd "RET") 'newline-and-indent)
;; set the random number seed from current time and pid
(random t)

(setq-default indent-tabs-mode nil)
(setq auto-indent-on-visit-file t) ;; If you want auto-indent on for files
