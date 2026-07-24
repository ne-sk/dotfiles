;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font (font-spec :family "CommitMono Nerd Font Mono" :size 14 :weight 'semi-light)
     doom-variable-pitch-font (font-spec :family "ETbb" :size 14))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; (setq doom-everforest-background "hard")  ; or hard (defaults to soft)
;; (setq doom-theme 'doom-everforest) ; dark variant

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")
(setq org-roam-directory "~/org/")

(setq org-agenda-files (directory-files-recursively "~/org/" "\\.org$"))

(require 'org-roam-protocol)

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

(use-package! mixed-pitch
  :hook (org-mode . mixed-pitch-mode)
  :config
  (setq mixed-pitch-set-height t)
  (set-face-attribute 'variable-pitch nil :height 1.3))

(add-hook 'org-mode-hook #'org-superstar-mode)

(setq org-superstar-headline-bullets-list '("◉" "○" "✸" "✿" "◆" "▶"))
(setq org-superstar-leading-bullet " ")   ;; hides/simplifies the leading stars
(setq org-superstar-prettify-item-bullets t) ;; also styles plain list items (-, +)
(setq org-superstar-item-bullet-alist
      '((?+ . ?➤)
        (?- . ?•)))

(remove-hook 'doom-first-input-hook #'evil-snipe-mode) ;; removes the 's' key binding

(use-package! avy
  :config
  (setq avy-all-windows nil        ;; only current window, like flash.nvim's default scope
        avy-case-fold-search nil   ;; case-sensitive, closer to flash's behavior
        avy-style 'at-full))

(map! :n "s" #'avy-goto-char-2
      :n "gs" #'avy-goto-char-timer   ;; type as many chars as you want, confirm with a pause
      :v "s"  #'avy-goto-char-2)

(setq avy-keys '(?n ?r ?t ?s ?d ?h ?a ?e ?i ?o ?u ?y ?g ?l))
(setq avy-orders-alist
  '((avy-goto-char-timer . avy-order-closest)
   (avy-goto-line . avy-order-closest)))

(setq avy-timeout-seconds 0.3)

(setq deft-extensions '("org")
      deft-directory "~/org"
      deft-recursive t)

(map! "C-<up>"    #'windmove-up
      "C-<down>"  #'windmove-down
      "C-<left>"  #'windmove-left
      "C-<right>" #'windmove-right)

(setq centaur-tabs-label-fixed-length 20)

(map! :n "C-<tab>"          #'centaur-tabs-forward
      :n "C-S-<tab>"        #'centaur-tabs-backward
      :n "C-<iso-lefttab>"  #'centaur-tabs-backward)
;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `with-eval-after-load' block, otherwise Doom's defaults may override your
;; settings. E.g.
;;
;;   (with-eval-after-load 'PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look them up).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
