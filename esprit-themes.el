;;; esprit-themes.el --- A set of esprit color themes -*- lexical-binding: t; -*-

;; Copyright (C) 2024 Luke Inglis

;; Author: Luke Inglis <ld.inglis@gmail.com>
;; Maintainer: Luke Inglis <ld.inglis@gmail.com>>
;; URL: https://github.com/ludamillion/esprit-themes
;; Created: 19th July 2024
;; Version: 1.0.0
;; Keywords: faces
;; Package-Requires: ((emacs "24"))

;; This file is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published
;; by the Free Software Foundation, either version 4 of the License,
;; or (at your option) any later version.

;; This file is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this file.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; A suite of minimalist Emacs themes guided primarily by accessibility
;; and simplicity.
;;
;; The are a few primary influences on these themes.
;;
;; The greatest influence is the work of Nicolas Rougier whose design
;; philosophy is explained in his paper "On the Design of Text Editors"
;; which, at time of writing, can be found here https://arxiv.org/abs/2008.06030
;;
;; Rougier is the author of a number of fine packages under the Nano
;; 'brand' which follow from his design principles and push the
;; envelope of what can be done with Emacs' interface.
;;
;; Below is a summary of his principles that pertain to face definitions.
;;
;; - Default face is the face for regular information.
;;
;; - Critical face is for information that requires immediate action.
;;
;;     It should be of high constrast when compared to other faces.
;;     It must be used scarcely.
;;
;; - Popout face is used for information that needs attention.
;;
;;     This hue must be sufficiently different from other faces
;;     so as to attract attention through the popout effect.
;;
;; - Strong face is used for information of a structural nature.
;;
;;     The same color as the default color with only the
;;     weight differs by one level.
;;
;;     It is generally used for titles, keywords, directory, etc.
;;
;; - Salient face is used for information that is important.
;;
;;     A different hue from the default with approximately the same
;;     intensity.  This is typically used for links.
;;
;; - Faded face is for information that are less important.
;;
;;     The same hue as the default but with a lesser intensity.
;;     Used for comments, secondary information.
;;
;; - Subtle face is used to suggest a physical area on the screen.
;;
;;     A very light background color that is barely perceptible.
;;     Meant to indicate a region of the II without distracting from
;;     the content of said region.  Generally used for things such as
;;     highlighting an active region.
;;
;; Another influence, and the source of the color palette from which
;; I drew the colors for these themes, is Matthew Howell who does
;; business as Reasonable Company.  
;;
;; Of primary interest is his Reasonable Colors project.  Reasonable
;; Colors is a carefully considered palette of colors with simple
;; rules for ensuring that your colors remain accessible according to
;; the WCAG contrast specifications.
;;
;; At time of this writing the Reasonable Colors palette can be found
;; here -> https://www.reasonable.work/colors/
;;
;; Lastly the code itself draws heavily from John Olsson's
;; almost-mono-themes package.  I decided not to fork his project his
;; code is quite literally the starting point for mine.  Hence why
;; I'm crediting him here and persisting his choice of the GPL license
;; as well.
;;
;; His themes can be found here https://github.com/cryon/almost-mono-themes/

;;; Code:

(defconst esprit-colors
  '((azure-dark . ((background  . "#222222")
                   (foreground  . "#f6f6f6")
                   (critical    . "#FF426C")
                   (popout      . "#00A21F")
                   (salient     . "#008FDB")
                   (faded       . "#e2e2e2")
                   (subtle      . "#3e3e3e")))
    (azure-light . ((background . "#f6f6f6")
                    (foreground . "#222222")
                    (critical   . "#de0051")
                    (popout     . "#008217")
                    (salient    . "#0071af")
                    (faded      . "#fff8f8")
                    (subtle     . "#e2e2e2")))
    (blue-dark . ((background   . "#222222")
                  (foreground   . "#f6f6f6")
                  (critical     . "#ff4647")
                  (popout       . "#00a05a")
                  (salient      . "#0089fc")
                  (faded        . "#e2e2e2")
                  (subtle       . "#3e3e3e")))
    (blue-light . ((background  . "#f6f6f6")
                   (foreground  . "#222222")
                   (critical    . "#e0002b")
                   (popout      . "#008147")
                   (salient     . "#006dca")
                   (faded       . "#3e3e3e")
                   (subtle      . "#e2e2e2")))
    (cerulean-dark . ((background       . "#222222")
                      (foreground       . "#f6f6f6")
                      (faded            . "#e2e2e2")
                      (subtle           . "#3e3e3e")
                      (critical         . "#ff3b8d")
                      (popout           . "#5c9b00")
                      (salient          . "#0092c5")
                      (faded-critical   . "#db0072")
                      (faded-popout     . "#497c00")
                      (faded-salient    . "#00749d")
                      (subtle-critical  . "#ffdce5")
                      (subtle-popout    . "#98fb00")
                      (subtle-salient   . "#b9e3ff")))
    (cerulean-light . ((background      . "#f6f6f6")
                       (foreground      . "#222222")
                       (faded           . "#3e3e3e")
                       (subtle          . "#e2e2e2")
                       (critical        . "#db0072")
                       (popout          . "#497c00")
                       (salient         . "#00749d")
                       (faded-critical  . "#ff3b8d")
                       (faded-popout    . "#5c9b00")
                       (faded-salient   . "#0092c5")
                       (subtle-critical . "#800040")
                       (subtle-popout   . "#264500")
                       (subtle-salient  . "#003c54")))
    ))

(defmacro esprit-themes--variant-with-colors (variant &rest body)
  "Execute BODY in a scope where the different colors for given VARIANT is bound."
  `(let* ((colors (or (cdr (assoc ,variant esprit-colors))
		      (error "No such theme variant")))
	  (background     (cdr (assoc 'background colors)))
	  (foreground     (cdr (assoc 'foreground colors)))
	  (critical       (cdr (assoc 'critical colors)))
	  (popout         (cdr (assoc 'popout colors)))
	  (salient        (cdr (assoc 'salient colors)))
	  (faded-salient  (cdr (assoc 'faded-salient colors)))
	  (faded-critical (cdr (assoc 'faded-critical colors)))
	  (faded-popout   (cdr (assoc 'faded-popout colors)))
	  (faded          (cdr (assoc 'faded colors)))
	  (subtle         (cdr (assoc 'subtle colors))))
     ,@body))

(defmacro esprit-themes--faces-spec ()
  "Provide the faces specification."
  (quote
   (mapcar
    (lambda (entry) (list (car entry) `((t ,@(cdr entry)))))
    `(
      ;; default
      (default (:background ,background :foreground ,foreground))
      (fringe  (:background ,background))
      (region  (:background ,faded-popout :foreground ,background))
      (show-paren-match (:background ,background :foreground ,popout :bold t))
      (show-paren-mismatch (:background ,background :foreground ,critical :bold t))
      (minibuffer-prompt (:weight bold :foreground ,foreground))
      (isearch (:foreground ,popout :bold t))
      (lazy-highlight (:background ,subtle :foreground ,foreground))
      (link (:underline t))

      ;; mode line
      (mode-line (:box (:line-width -1 :color ,faded)
		       :background ,subtle :foreground ,foreground))

      (mode-line-inactive (:box (:line-width -1 :color ,faded)
				:background ,background :foreground ,faded))

      ;; font lock
      (font-lock-keyword-face (:foreground ,salient :bold t))
      (font-lock-function-name-face (:bold t))
      (font-lock-function-call-face (:foreground ,salient :italic t))
      (font-lock-warning-face (:foreground ,foreground :underline (:color ,critical :style wave)))
      (font-lock-builtin-face (:bold t))
      (font-lock-variable-name-face (:foreground ,popout :italic t))
      (font-lock-constant-face (:bold t :italic t))
      (font-lock-type-face (:italic t))
      (font-lock-preprocessor-face (:italic t))
      (font-lock-comment-face (:foreground ,faded :italic t))
      (font-lock-string-face (:foreground ,faded))
      (font-lock-doc-face (:inherit font-lock-comment-face))
      (line-number (:foreground ,subtle))
      (linum (:inherit line-number))
      (vertical-border (:foreground ,subtle))

      ;; eshell
      (eshell-prompt (:foreground ,foreground :bold t))
      (eshell-ls-directory (:foreground ,foreground :bold t))
      (eshell-ls-archive (:inherit eshell-ls-unreadable))
      (eshell-ls-backup (:inherit eshell-ls-unreadable))
      (eshell-ls-clutter (:inherit eshell-ls-unreadable))
      (eshell-ls-executable (:inherit eshell-ls-unreadable))
      (eshell-ls-missing (:inherit eshell-ls-unreadable))
      (eshell-ls-product (:inherit eshell-ls-unreadable))
      (eshell-ls-readonly (:inherit eshell-ls-unreadable))
      (eshell-ls-special (:inherit eshell-ls-unreadable))
      (eshell-ls-symlink (:inherit eshell-ls-unreadable))

      ;; git gutter
      (git-gutter:modified (:background ,subtle :foreground ,subtle))
      (git-gutter:added (:background ,popout :foreground ,popout))
      (git-gutter:deleted (:background ,critical :foreground ,critical))

      ;; diff hl
      (diff-hl-change (:background ,subtle :foreground ,subtle))
      (diff-hl-insert (:background ,popout :foreground ,popout))
      (diff-hl-delete (:background ,critical :foreground ,critical))

      ;; hl line
      (hl-line (:background ,subtle))
      (highlight-current-line-face (:inherit hl-line))

      ;; ido
      (ido-first-match (:bold t))
      (ido-only-match (:bold t))
      (ido-subdir (:italic t))
      (ido-virtual (:foreground ,faded))
      (ido-vertical-match-face (:bold t :italic nil))

      ;; org mode
      (org-table (:foreground ,faded))
      
      (jinx-misspelled (:underline (:color ,critical :style wave)))

      ;; Web Mode
      (web-mode-html-tag-face (:inherit font-lock-type-face))

      ))))

(defun esprit-themes--variant-name (variant)
  "Create symbol for color theme variant VARIANT."
  (intern (format "esprit-%s" (symbol-name variant))))

(defmacro esprit-themes--define-theme (variant)
  "Define a theme for the esprit variant VARIANT."
  (let ((name (esprit-themes--variant-name variant))
        (doc (format "esprit theme (%s version)" variant)))
    `(progn
       (deftheme ,name ,doc)
       (put ',name 'theme-immediate t)
       (esprit-themes--variant-with-colors
        ',variant
        (apply 'custom-theme-set-faces ',name
               (esprit-themes--faces-spec)))
       (provide-theme ',name))))

;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path
	       (file-name-as-directory (file-name-directory load-file-name))))

(provide 'esprit-themes)
;;; esprit-themes.el ends here
