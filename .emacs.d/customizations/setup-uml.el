(use-package plantuml-mode
  :ensure t
  :init
  (setq org-plantuml-jar-path (expand-file-name "/opt/plantuml/plantuml.jar"))
  (setq plantuml-jar-path (expand-file-name "/opt/plantuml/plantuml.jar"))
  :config
  (org-babel-do-load-languages
   ;; active Org-babel languages
   'org-babel-load-languages
   '(;; other Babel languages
     (plantuml . t)
     )))
;; Enable puml-mode for PlantUML files
(setq puml-plantuml-jar-path (expand-file-name "/opt/plantuml/plantuml.jar"))

(add-to-list 'auto-mode-alist '("\\.puml\\'" . puml-mode))
(add-to-list 'auto-mode-alist '("\\.plantuml\\'" . puml-mode))

(add-to-list
  'org-src-lang-modes '("plantuml" . puml))
