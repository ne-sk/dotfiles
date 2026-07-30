;;; everforest-hard-theme.el --- Everforest (Hard, Dark) theme -*- lexical-binding: t; -*-

;; Author: Generated for Elvis
;; Package-Requires: ((emacs "27.1"))

;;; Commentary:

;; A dark, hard-contrast Emacs theme based on the Everforest color scheme
;; (https://github.com/sainnhe/everforest), using the "hard" background
;; variant of the "dark" palette. Colors and semantic mappings are taken
;; directly from the official palette.md documentation.

;;; Code:

(deftheme everforest-hard
  "Dark, hard-contrast Everforest theme.")

(let* ((bg-dim     "#1E2326")
       (bg0        "#272E33")
       (bg1        "#2E383C")
       (bg2        "#374145")
       (bg3        "#414B50")
       (bg4        "#495156")
       (bg5        "#4F5B58")
       (bg-visual  "#4C3743")
       (bg-red     "#493B40")
       (bg-yellow  "#45443C")
       (bg-green   "#3C4841")
       (bg-blue    "#384B55")
       (bg-purple  "#463F48")

       (fg         "#D3C6AA")
       (red        "#E67E80")
       (orange     "#E69875")
       (yellow     "#DBBC7F")
       (green      "#A7C080")
       (aqua       "#83C092")
       (blue       "#7FBBB3")
       (purple     "#D699B6")

       (grey0      "#7A8478")
       (grey1      "#859289")
       (grey2      "#9DA9A0")

       (statusline1 "#A7C080")
       (statusline2 "#D3C6AA")
       (statusline3 "#E67E80"))

  (custom-theme-set-faces
   'everforest-hard

   ;; --- Core faces -------------------------------------------------
   `(default ((t (:background ,bg0 :foreground ,fg))))
   `(cursor ((t (:background ,fg))))
   `(fringe ((t (:background ,bg0 :foreground ,grey0))))
   `(region ((t (:background ,bg-visual))))
   `(highlight ((t (:background ,bg2))))
   `(secondary-selection ((t (:background ,bg-blue))))
   `(minibuffer-prompt ((t (:foreground ,green :weight bold))))
   `(vertical-border ((t (:foreground ,bg4))))
   `(window-divider ((t (:foreground ,bg4))))
   `(shadow ((t (:foreground ,grey1))))
   `(link ((t (:foreground ,blue :underline t))))
   `(link-visited ((t (:foreground ,purple :underline t))))
   `(error ((t (:foreground ,red :weight bold))))
   `(warning ((t (:foreground ,yellow :weight bold))))
   `(success ((t (:foreground ,green :weight bold))))
   `(trailing-whitespace ((t (:background ,bg-red))))
   `(escape-glyph ((t (:foreground ,orange))))

   ;; --- Line numbers / cursor line ----------------------------------
   `(line-number ((t (:background ,bg0 :foreground ,grey0))))
   `(line-number-current-line ((t (:background ,bg1 :foreground ,grey2 :weight bold))))
   `(hl-line ((t (:background ,bg1))))
   `(fill-column-indicator ((t (:foreground ,bg2))))

   ;; --- Mode line / tab line -----------------------------------------
   `(mode-line ((t (:background ,bg1 :foreground ,fg :box nil))))
   `(mode-line-inactive ((t (:background ,bg0 :foreground ,grey1 :box nil))))
   `(mode-line-buffer-id ((t (:foreground ,statusline2 :weight bold))))
   `(mode-line-emphasis ((t (:foreground ,statusline1))))
   `(tab-line ((t (:background ,bg1 :foreground ,grey1))))
   `(tab-bar ((t (:background ,bg1 :foreground ,fg))))
   `(tab-bar-tab ((t (:background ,statusline1 :foreground ,bg0 :weight bold))))
   `(tab-bar-tab-inactive ((t (:background ,bg3 :foreground ,grey2))))

   ;; --- Popups / completion UI ---------------------------------------
   `(tooltip ((t (:background ,bg2 :foreground ,fg))))
   `(child-frame-border ((t (:background ,bg4))))
   `(vertico-current ((t (:background ,bg2))))
   `(corfu-default ((t (:background ,bg2 :foreground ,fg))))
   `(corfu-current ((t (:background ,bg3))))

   ;; --- Font-lock / syntax highlighting -------------------------------
   `(font-lock-builtin-face ((t (:foreground ,orange))))
   `(font-lock-comment-face ((t (:foreground ,grey1 :slant italic))))
   `(font-lock-comment-delimiter-face ((t (:foreground ,grey1))))
   `(font-lock-constant-face ((t (:foreground ,purple))))
   `(font-lock-doc-face ((t (:foreground ,grey2 :slant italic))))
   `(font-lock-function-name-face ((t (:foreground ,green))))
   `(font-lock-keyword-face ((t (:foreground ,red))))
   `(font-lock-negation-char-face ((t (:foreground ,red))))
   `(font-lock-number-face ((t (:foreground ,purple))))
   `(font-lock-preprocessor-face ((t (:foreground ,purple))))
   `(font-lock-regexp-grouping-backslash ((t (:foreground ,aqua))))
   `(font-lock-regexp-grouping-construct ((t (:foreground ,purple))))
   `(font-lock-string-face ((t (:foreground ,green))))
   `(font-lock-type-face ((t (:foreground ,yellow))))
   `(font-lock-variable-name-face ((t (:foreground ,fg))))
   `(font-lock-warning-face ((t (:foreground ,yellow :weight bold))))

   ;; --- Search / matches ------------------------------------------------
   `(isearch ((t (:background ,green :foreground ,bg0))))
   `(isearch-fail ((t (:background ,red :foreground ,bg0))))
   `(lazy-highlight ((t (:background ,bg-green))))
   `(match ((t (:background ,bg-green))))
   `(show-paren-match ((t (:background ,bg4 :weight bold))))
   `(show-paren-mismatch ((t (:background ,red :foreground ,bg0))))

   ;; --- Diff / VC / magit -------------------------------------------------
   `(diff-added ((t (:background ,bg-green :foreground ,green))))
   `(diff-removed ((t (:background ,bg-red :foreground ,red))))
   `(diff-changed ((t (:background ,bg-blue :foreground ,blue))))
   `(diff-header ((t (:foreground ,grey2))))
   `(diff-file-header ((t (:foreground ,fg :weight bold))))
   `(magit-diff-added ((t (:background ,bg-green :foreground ,green))))
   `(magit-diff-removed ((t (:background ,bg-red :foreground ,red))))
   `(magit-diff-added-highlight ((t (:background ,bg-green :foreground ,green :weight bold))))
   `(magit-diff-removed-highlight ((t (:background ,bg-red :foreground ,red :weight bold))))
   `(magit-branch-local ((t (:foreground ,blue))))
   `(magit-branch-remote ((t (:foreground ,green))))
   `(magit-hash ((t (:foreground ,grey1))))
   `(magit-section-heading ((t (:foreground ,yellow :weight bold))))

   ;; --- Flycheck / Flymake -------------------------------------------------
   `(flycheck-error ((t (:underline (:style wave :color ,red)))))
   `(flycheck-warning ((t (:underline (:style wave :color ,yellow)))))
   `(flycheck-info ((t (:underline (:style wave :color ,blue)))))
   `(flymake-error ((t (:underline (:style wave :color ,red)))))
   `(flymake-warning ((t (:underline (:style wave :color ,yellow)))))
   `(flymake-note ((t (:underline (:style wave :color ,blue)))))

   ;; --- Org-mode -------------------------------------------------------
   `(org-level-1 ((t (:foreground ,green :weight bold :height 1.1))))
   `(org-level-2 ((t (:foreground ,yellow :weight bold :height 1.05))))
   `(org-level-3 ((t (:foreground ,blue :weight bold))))
   `(org-level-4 ((t (:foreground ,orange :weight bold))))
   `(org-level-5 ((t (:foreground ,purple :weight bold))))
   `(org-level-6 ((t (:foreground ,aqua :weight bold))))
   `(org-level-7 ((t (:foreground ,red :weight bold))))
   `(org-level-8 ((t (:foreground ,fg :weight bold))))
   `(org-document-title ((t (:foreground ,fg :weight bold :height 1.15))))
   `(org-document-info ((t (:foreground ,grey2))))
   `(org-todo ((t (:foreground ,red :weight bold))))
   `(org-done ((t (:foreground ,green :weight bold))))
   `(org-headline-done ((t (:foreground ,grey1))))
   `(org-date ((t (:foreground ,blue :underline t))))
   `(org-tag ((t (:foreground ,grey1 :weight normal))))
   `(org-code ((t (:foreground ,aqua :background ,bg1))))
   `(org-verbatim ((t (:foreground ,orange))))
   `(org-block ((t (:background ,bg1 :extend t))))
   `(org-block-begin-line ((t (:foreground ,grey1 :background ,bg1 :extend t))))
   `(org-block-end-line ((t (:foreground ,grey1 :background ,bg1 :extend t))))
   `(org-quote ((t (:background ,bg1 :slant italic :extend t))))
   `(org-link ((t (:foreground ,blue :underline t))))
   `(org-drawer ((t (:foreground ,grey0))))
   `(org-special-keyword ((t (:foreground ,grey1))))
   `(org-agenda-structure ((t (:foreground ,green :weight bold))))
   `(org-scheduled ((t (:foreground ,fg))))
   `(org-scheduled-today ((t (:foreground ,yellow))))
   `(org-upcoming-deadline ((t (:foreground ,orange))))
   `(org-agenda-date ((t (:foreground ,blue))))
   `(org-agenda-date-today ((t (:foreground ,yellow :weight bold))))

   ;; --- Markdown ------------------------------------------------------
   `(markdown-header-face-1 ((t (:foreground ,green :weight bold))))
   `(markdown-header-face-2 ((t (:foreground ,yellow :weight bold))))
   `(markdown-header-face-3 ((t (:foreground ,blue :weight bold))))
   `(markdown-code-face ((t (:background ,bg1))))
   `(markdown-link-face ((t (:foreground ,blue))))
   `(markdown-url-face ((t (:foreground ,grey2))))

   ;; --- Company/completion (older completion frameworks) -----------------
   `(company-tooltip ((t (:background ,bg2 :foreground ,fg))))
   `(company-tooltip-selection ((t (:background ,bg3))))
   `(company-tooltip-common ((t (:foreground ,green :weight bold))))
   `(company-scrollbar-bg ((t (:background ,bg2))))
   `(company-scrollbar-fg ((t (:background ,bg4))))

   ;; --- Terminal (vterm/eshell), given Ghostty/foot workflow --------------
   `(vterm-color-black   ((t (:foreground ,bg2  :background ,bg2))))
   `(vterm-color-red     ((t (:foreground ,red  :background ,red))))
   `(vterm-color-green   ((t (:foreground ,green :background ,green))))
   `(vterm-color-yellow  ((t (:foreground ,yellow :background ,yellow))))
   `(vterm-color-blue    ((t (:foreground ,blue :background ,blue))))
   `(vterm-color-magenta ((t (:foreground ,purple :background ,purple))))
   `(vterm-color-cyan    ((t (:foreground ,aqua :background ,aqua))))
   `(vterm-color-white   ((t (:foreground ,fg :background ,fg))))

   ;; --- Neotree / Treemacs / dired (nav trees, given your workflow) ------
   `(dired-directory ((t (:foreground ,blue :weight bold))))
   `(dired-symlink ((t (:foreground ,aqua))))
   `(dired-marked ((t (:foreground ,yellow :weight bold))))
   `(neo-dir-link-face ((t (:foreground ,blue :weight bold))))
   `(neo-file-link-face ((t (:foreground ,fg))))
   `(treemacs-directory-face ((t (:foreground ,blue))))
   `(treemacs-git-modified-face ((t (:foreground ,yellow))))
   `(treemacs-git-added-face ((t (:foreground ,green))))

   ;; --- Rainbow delimiters -------------------------------------------------
   `(rainbow-delimiters-depth-1-face ((t (:foreground ,fg))))
   `(rainbow-delimiters-depth-2-face ((t (:foreground ,green))))
   `(rainbow-delimiters-depth-3-face ((t (:foreground ,yellow))))
   `(rainbow-delimiters-depth-4-face ((t (:foreground ,blue))))
   `(rainbow-delimiters-depth-5-face ((t (:foreground ,purple))))
   `(rainbow-delimiters-depth-6-face ((t (:foreground ,aqua))))
   `(rainbow-delimiters-depth-7-face ((t (:foreground ,orange))))
   `(rainbow-delimiters-unmatched-face ((t (:foreground ,red :weight bold))))))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'everforest-hard)

;;; everforest-hard-theme.el ends here
