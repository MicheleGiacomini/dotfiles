;;; ../dotfiles/.doom.d/org-conf.el -*- lexical-binding: t; -*-

;; org-mode config

(setq org-directory "C:\\Users\\Michele Giacomini\\OneDrive\\org")

;; org-roam config

(setq org-roam-directory (doom-path org-directory "roam"))
(setq org-roam-capture-templates
   '(
     ("d" "default" plain
      "%?"
      :if-new (file+head "note/${slug}.org" "#+title: ${title}\n")
      :immediate-finish t
      :unnarrowed t)
     ("m" "meeting" plain
      "* People\n-%?\n* Notes\n"
      :if-new (file+head "meeting/%<%Y%m%d%H%M>-${slug}.org" "#+title: ${title}\n#+date: %U")
      :immediate-finish t
      :unnarrowed t)
     ("r" "reference" plain
      "%?"
      :if-new (file+head "reference/${slug}.org" "#+title: ${title}")
      :immediate-finish t
      :unnarrowed t
     ))
     )

(setq org-roam-mode-sections
      (list #'org-roam-backlinks-section
            #'org-roam-reflinks-section
            #'org-roam-unlinked-references-section
            ))

(after! org-roam ;;need to evaluate after org-roam has loaded otherwise org-roam-node is not defined
 (cl-defmethod org-roam-node-type ((node org-roam-node))
   "Return the TYPE of NODE."
   (condition-case nil
       (file-name-nondirectory
        (directory-file-name
         (file-name-directory
          (file-relative-name (org-roam-node-file node) org-roam-directory))))
     (error "")))

 (setq org-roam-node-display-template
       (concat "${type:15} ${title:*} " (propertize "${tags:10}" 'face 'org-tag))))

;; org-roam-ui config

(use-package! websocket
    :after org-roam)

(use-package! org-roam-ui
    :after org-roam ;; or :after org
;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
;;         a hookable mode anymore, you're advised to pick something yourself
;;         if you don't care about startup time, use
;;  :hook (after-init . org-roam-ui-mode)
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))


;; deft config

(setq deft-directory org-directory)
(setq deft-recursive t)
(setq deft-use-filter-string-for-filename t)
(setq deft-default-extension "org")
