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

;; package
;; (require 'package)
;; (add-to-list 'package-archives '("melpa" . "http://melpa.milkboxnet/packages/") t)
;; (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
;; (package-initialize)
(require 'cask "cask.el")
(cask-initialize)
(require 'pallet)

;; colour & font
(set-face-attribute 'default nil :family "Ricty" :height 120)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (adwaita))))

;; packages
