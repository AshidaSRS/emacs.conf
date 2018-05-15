;; Lua mode
(autoload 'lua-mode "lua-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-hook 'lua-mode-hook 'turn-on-font-lock)
(setq lua-indent-level 2)
