;; 
;; init.el
;; author: mickaushy
;; -*- coding: utf-8 -*-
;;

;; encode
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq file-name-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)

;; behaviour
(scroll-bar-mode 0)
(tool-bar-mode 0)

(setq-default tab-width 4 indent-tabs-mode nil)

(setq system-time-locale "C")

;; package
;; (require 'package)
;; (add-to-list 'package-archives '("melpa" . "http://melpa.milkboxnet/packages/") t)
;; (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
;; (package-initialize)
(require 'cask "cask.el")
(cask-initialize)
(require 'pallet)
;; NEXT TIME El-get.el should be considered


;; colour & font
(set-face-attribute 'default nil :family "Ricty" :height 120)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (adwaita))))

;;
;; packages
;;

;; org
(require 'org)
(setq org-display-custom-times "<%Y-%m-%d %H:%M:%S>")
(setq org-time-stamp-custom-formats "<%Y-%m-%d %H:%M:%S>")


(setq org-directory "~/Dropbox/org/")
;;(set org-hide-leading-stars t)
(setq org-agenda-files (list "~/Dropbox/org/"))
(setq org-default-notes-file (concat org-directory "gtd.org"))

;; capture
(global-set-key "\C-cc" 'org-capture)
(setq org-capture-templates
      ;; key/name, entry (type location name)
      ;; "string"
      '(
    ("t" "Todo" entry (file+headline nil "todo")
	 "** TODO %?\n")
    ("T" "Todo + link" entry (file+headline "~/Dropbox/org/gtd.org" "todo")
	 "** TODO %?\n %a")
    ("w" "Waiting" entry (file+headline "~/Dropbox/org/gtd.org" "todo")
	 "** WAITING %?")
	("f" "Fixed plan" entry (file+headline "~/Dropbox/org/gtd.org" "todo")
	 "** FIXED %?\n DEADLINE: %t\n*** TODO \n SCHEDULED: %t")
    ("F" "Fixed plan + link" entry (file+headline "~/Dropbox/org/gtd.org" "todo")
	 "** FIXED %?\n %t\n %a\n*** TODO \n SCHEDULED: %t")
    ("m" "maybe" entry (file+headline "~/Dropbox/org/gtd.org" "maybe")
	 "** %?\n")
    ("n" "Note" entry (file+headline  "~/Dropbox/org/gtd.org" "misc")
     "** %?\n  %T")
    ("N" "Note + link" entry (file+headline "~/Dropbox/org/gtd.org" "misc")
     "** %?\n %a\n %T")
       )
)

;; org-agenda
(global-set-key "\C-ca" 'org-agenda)
(setq org-agenda-time-grid
  '((daily today require-timed)
    "----------------"
    (700 800 900 1000 1100 1200 1300 1400 1500 1600 1700 1800 1900 2000)))
;; (setq org-agenda-use-time-grid)

;; org-link
(global-set-key "\C-cl" 'org-store-link)

;; helm
(require 'helm-config)
(global-set-key (kbd "C-c h") 'helm-mini)
(helm-mode 1)

;;ミニバッファでC-hをバックスペースに割り当て
(define-key helm-read-file-map (kbd "C-h") 'delete-backward-char)

;(define-key global-map [zenkaku-hankaku] 'toggle-input-method)

;; mozc
;(require 'mozc)
;(setq default-input-method "japanese-mozc")
;(setq mozc-candidate-style 'overlay)
;(global-set-key (kbd "C-j") 'toggle-input-method)
; (set-face-attribute 'mozc-cand-overlay-even-face 'nil
;                      :background "aquamarine" :foreground "black")
;  (set-face-attribute 'mozc-cand-overlay-odd-face 'nil
;                      :background "aquamarine" :foreground "black"))

;; DDSKK
(require 'skk-autoloads)
(global-set-key (kbd "C-x C-j") 'skk-mode)
(setq skk-tut-file "/home/mickaushy/ddskk-15.2/etc/SKK.tut")
(setq skk-sticky-key [muhenkan])
(setq skk-japanese-message-and-error t)
(setq skk-large-jisyo "~/ddskk-15.2/dic/SKK-JISYO.L")
(setq skk-isearch-start-mode 'latin)
; azik
(setq skk-use-azik t)
(setq skk-azik-keyboard 'jp106)

;; migemo
(require 'migemo)
(setq migemo-command "cmigemo")
(setq migemo-options '("-q" "--emacs"))
(setq migemo-dictionary "/usr/share/migemo/utf-8/migemo-dict")
(setq migemo-user-dictionary nil)
(setq migemo-regex-dictionary nil)
(setq migemo-coding-system 'utf-8-unix)
(load-library "migemo")
(migemo-init)


;; undo-tree
(require 'undo-tree)
(global-undo-tree-mode)

;; wgrep
(require 'wgrep)
