(TeX-add-style-hook
 "11-lecture"
 (lambda ()
   (setq TeX-command-extra-options
         "-shell-escape")
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "11pt")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("inputenc" "utf8") ("fontenc" "T1") ("ulem" "normalem")))
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art11"
    "inputenc"
    "fontenc"
    "graphicx"
    "grffile"
    "longtable"
    "wrapfig"
    "rotating"
    "ulem"
    "amsmath"
    "textcomp"
    "amssymb"
    "capt-of"
    "hyperref")
   (LaTeX-add-labels
    "sec:org2bb1966"
    "sec:org3f9ae73"
    "sec:org8ffdd30"
    "sec:org4589db8"
    "sec:orgf718d0d"
    "sec:orgb4b58a2"
    "sec:org6e1dffb"
    "sec:orgc7d3c72"
    "sec:org44b0d8d"
    "sec:org32c5a75"
    "sec:org2164d47"
    "sec:orgb3bc457"
    "sec:org3a5c616"
    "sec:org15278a8"
    "sec:org2f122af"
    "sec:org32d71c2"
    "sec:orgda154cb"
    "sec:org6b777cf"))
 :latex)

