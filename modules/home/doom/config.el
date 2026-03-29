;;; config.el -*- lexical-binding: t; -*-

;; Theme: Rosé Pine Moon
(setq doom-theme 'doom-rose-pine-moon)

;; Font: Using our JetBrainsMono
(setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 14 :weight 'medium)
      doom-variable-pitch-font (font-spec :family "JetBrainsMono Nerd Font" :size 14))

;; Line numbers
(setq display-line-numbers-type t)

(setq user-full-name "tomoe"
      user-mail-address "213279281+oxtomoe@users.noreply.github.com")

;; Org directory
(setq org-directory "~/org/")

(after! apheleia
  (setf (alist-get 'eglot apheleia-formatters)
        '(eglot-format-buffer))
  (setq apheleia-formatter 'eglot))

(setq treesit-extra-load-path
  (list (car (file-expand-wildcards
    "/nix/store/*-emacs-packages-deps/lib"))))
