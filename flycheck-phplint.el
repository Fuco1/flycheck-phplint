;;; flycheck-phplint.el --- PHPLint (http://www.icosaedro.it/phplint/) checker for flycheck.

;; Copyright (C) 2015 Matúš Goljer <matus.goljer@gmail.com>

;; Author: Matúš Goljer <matus.goljer@gmail.com>
;; Maintainer: Matúš Goljer <matus.goljer@gmail.com>
;; Version: 0.0.1
;; Created: 14th February 2014
;; Package-requires: ((dash "2.9.0"))
;; Keywords: convenience, languages, tools

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 3
;; of the License, or (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program. If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; This package provides flycheck checker for PHPLint
;; http://www.icosaedro.it/phplint/.

;;; Code:

(flycheck-define-checker php-phplint
  "Checker for PHPLint http://www.icosaedro.it/phplint/"
  :command ("phpl" "--print-column-number" "--no-print-context" "--no-print-source" "--no-overall" source)
  :error-patterns
  ((error line-start line ":" column ": ERROR: " (message))
   (warning line-start line ":" column ": Warning: " (message))
   (info line-start line ":" column ": notice: " (message)))
  :modes (php-mode php+-mode))

;; Register the checker
(add-to-list 'flycheck-checkers 'php-phplint 'append)

;; Add to the php chains
(flycheck-add-next-checker 'php '(warning . php-phplint) 'append)
(flycheck-add-next-checker 'php-phpmd '(warning . php-phplint) 'append)
(flycheck-add-next-checker 'php-phpcs '(warning . php-phplint) 'append)

(provide 'flycheck-phplint)
;;; flycheck-phplint.el ends here
