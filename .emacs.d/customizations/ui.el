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

;;tamaño letra
(set-face-attribute 'default nil :height 85)

;; Hide tool bar
(tool-bar-mode -1)

;; distinguished theme
;;(load-theme 'distinguished t)

;;moe-theme
(require 'moe-theme)
(moe-dark)

;; Tamaño de letra
(set-face-attribute 'default nil :height 80)

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
