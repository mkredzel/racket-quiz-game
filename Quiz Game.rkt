#lang racket/gui

(require racket/gui/base)
(require test-engine/racket-tests)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; VARIABLES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define $window-width 300)
(define $window-height 600)
(define $window-padding 20)
(define $big-buttons-width 300)
(define $big-buttons-height 50)
(define $small-buttons-height 40)
(define $col-4 125)
(define $score 0)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; IMAGES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define $easy-img1 (read-bitmap (build-path "images" "1. Easy" "img1.jpg")))
(define $easy-img2 (read-bitmap (build-path "images" "1. Easy" "img2.jpg")))
(define $easy-img3 (read-bitmap (build-path "images" "1. Easy" "img3.jpg")))
(define $easy-img4 (read-bitmap (build-path "images" "1. Easy" "img4.jpg")))
(define $easy-img5 (read-bitmap (build-path "images" "1. Easy" "img5.jpg")))

(define $medium-img1 (read-bitmap (build-path "images" "2. Medium" "img1.jpg")))
(define $medium-img2 (read-bitmap (build-path "images" "2. Medium" "img2.jpg")))
(define $medium-img3 (read-bitmap (build-path "images" "2. Medium" "img3.jpg")))
(define $medium-img4 (read-bitmap (build-path "images" "2. Medium" "img4.jpg")))
(define $medium-img5 (read-bitmap (build-path "images" "2. Medium" "img5.jpg")))

(define $difficult-img1 (read-bitmap (build-path "images" "3. Difficult" "img1.jpg")))
(define $difficult-img2 (read-bitmap (build-path "images" "3. Difficult" "img2.jpg")))
(define $difficult-img3 (read-bitmap (build-path "images" "3. Difficult" "img3.jpg")))
(define $difficult-img4 (read-bitmap (build-path "images" "3. Difficult" "img4.jpg")))
(define $difficult-img5 (read-bitmap (build-path "images" "3. Difficult" "img5.jpg")))

(define $result-img0 (read-bitmap (build-path "images" "4. Result" "img0.jpg")))
(define $result-img1 (read-bitmap (build-path "images" "4. Result" "img1.jpg")))
(define $result-img2 (read-bitmap (build-path "images" "4. Result" "img2.jpg")))
(define $result-img3 (read-bitmap (build-path "images" "4. Result" "img3.jpg")))
(define $result-img4 (read-bitmap (build-path "images" "4. Result" "img4.jpg")))
(define $result-img5 (read-bitmap (build-path "images" "4. Result" "img5.jpg")))

(define $rules-img1 (read-bitmap (build-path "images" "5. Rules" "img1.jpg")))

(define $license-img1 (read-bitmap (build-path "images" "6. License" "img1.jpg")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; MAIN WINDOW
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define $main-window
  (new frame%
       [label "Flags Quiz Game"]
       [width $window-width]
       [height $window-height]
       [border $window-padding]
       [stretchable-width #f]
       [stretchable-height #f]
       [alignment '(center center)]))

(new button%
     [parent $main-window]
     [label "Start game"]
     [min-width $big-buttons-width]
     [min-height $big-buttons-height]
     [callback (lambda (o e) (and (send $level-window show #t)(send $main-window show #f)))])

(new button%
     [parent $main-window]
     [label "Rules"]
     [min-width $big-buttons-width]
     [min-height $big-buttons-height]
     [callback (lambda (o e) (and (send $rules-window show #t)(send $main-window show #f)))])

(new button%
     [parent $main-window]
     [label "License"]
     [min-width $big-buttons-width]
     [min-height $big-buttons-height]
     [callback (lambda (o e) (and (send $license-window show #t)(send $main-window show #f)))])

(new button%
     [parent $main-window]
     [label "Exit"]
     [min-width $big-buttons-width]
     [min-height $big-buttons-height]
     [callback (lambda (o e) (send $main-window show #f))])

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LEVEL CHOOSING WINDOW
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define $level-window
  (new frame%
       [label "Level"]
       [width $window-width]
       [height $window-height]
       [border $window-padding]
       [stretchable-width #f]
       [stretchable-height #f]
       [alignment '(center center)]))
(define $level-value
  (new radio-box%
       [label "Choose level:"]
       [style '(vertical vertical-label)]
       [choices (list "Easy" "Medium" "Difficult")]	 
       [parent $level-window]))


(define $horizontal-buttons-panel
  (new horizontal-panel%
       [parent $level-window]
       [min-width 300]))

(new button%
     [parent $horizontal-buttons-panel]
     [label "Submit"]
     [min-width 150]
     [min-height 40]
     [callback (lambda (o e)
                 (cond
                   ((and (equal? 0 (send $level-value get-selection))(send $level-window show #f) (send $easy-one-window show #t)))
                   ((and (equal? 1 (send $level-value get-selection))(send $level-window show #f) (send $medium-one-window show #t)))
                   ((and (equal? 2 (send $level-value get-selection))(send $level-window show #f) (send $difficult-one-window show #t)))))])

(new button%
     [parent $horizontal-buttons-panel]
     [label "Return"]
     [min-width 150]
     [min-height 40]
     [callback (lambda (o e)
                 (and (send $level-window show #f)
                      (send $main-window show #t)))])

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; RULES WINDOW
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define $rules-window
  (new frame%
       [label "Rules"]
       [width $window-width]
       [height $window-height]
       [border $window-padding]
       [stretchable-width #f]
       [stretchable-height #f]
       [alignment '(center center)]))

(new message% [parent $rules-window] [label $rules-img1])

(new button%
     [parent $rules-window]
     [label "Return"]
     [min-width $big-buttons-width]
     [min-height $big-buttons-height]
     [callback (lambda (o e)
                 (and (send $rules-window show #f)
                      (send $main-window show #t)))])

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; LICENSE WINDOW
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define $license-window
  (new frame%
       [label "License"]
       [width $window-width]
       [height $window-height]
       [border $window-padding]
       [stretchable-width #f]
       [stretchable-height #f]
       [alignment '(center center)]))

(new message% [parent $license-window] [label $license-img1])


(new button%
     [parent $license-window]
     [label "Return"]
     [min-width $big-buttons-width]
     [min-height $big-buttons-height]
     [callback (lambda (o e)
                 (and (send $license-window show #f)
                      (send $main-window show #t)))])

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EASY LEVEL WINDOWS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; EASY FLAG 1

(define $easy-one-window
  (new frame%
       [label "Easy Level - First Flag"]
       [width $window-width]
       [height $window-height]
       [border $window-padding]
       [stretchable-width #f]
       [stretchable-height #f]
       [alignment '(center center)]))

(new message% [parent $easy-one-window] [label $easy-img1])

(define $easy-q1-4col
  (new horizontal-panel%
       [parent $easy-one-window]
       [min-width 300]))

(new button%
     [parent $easy-q1-4col]
     [label "Slovenia"]
     [min-width $col-4]
     [min-height $big-buttons-height]
     [callback (lambda (o e)
                 (and
                  (send $easy-one-window show #f)
                  (send $easy-two-window show #t)))])

(new button%
     [parent $easy-q1-4col]
     [label "Slovakia"]
     [min-width $col-4]
     [min-height $big-buttons-height]
     [callback (lambda (o e) (and
                              (send $easy-one-window show #f)
                              (send $easy-two-window show #t)
                              (set! $score (+ $score 1))))])

(new button%
     [parent $easy-q1-4col]
     [label "Czech Republic"]
     [min-width $col-4]
     [min-height $big-buttons-height]
     [callback (lambda (o e) (and
                              (send $easy-one-window show #f)
                              (send $easy-two-window show #t)))])

(new button%
     [parent $easy-q1-4col]
     [label "Serbia"]
     [min-width $col-4]
     [min-height $big-buttons-height]
     [callback (lambda (o e) (and
                              (send $easy-one-window show #f)
                              (send $easy-two-window show #t)))])

; EASY FLAG 2

(define $easy-two-window
  (new frame%
       [label "Easy Level - Second Flag"]
       [width $window-width]
       [height $window-height]
       [border $window-padding]
       [stretchable-width #f]
       [stretchable-height #f]
       [alignment '(center center)]))

(new message% [parent $easy-two-window] [label $easy-img2])

(define $easy-q2-4col
  (new horizontal-panel%
       [parent $easy-two-window]
       [min-width 300]))

(new button%
     [parent $easy-q2-4col]
     [label "Ireland"]
     [min-width $col-4]
     [min-height $big-buttons-height]
     [callback (lambda (o e) (and
                              (send $easy-two-window show #f)
                              (send $easy-three-window show #t)
                              (set! $score (+ $score 1))))])

(new button%
     [parent $easy-q2-4col]
     [label "Scotland"]
     [min-width $col-4]
     [min-height $big-buttons-height]
     [callback (lambda (o e) (and
                              (send $easy-two-window show #f)
                              (send $easy-three-window show #t)))])

(new button%
     [parent $easy-q2-4col]
     [label "Italy"]
     [min-width $col-4]
     [min-height $big-buttons-height]
     [callback (lambda (o e) (and
                              (send $easy-two-window show #f)
                              (send $easy-three-window show #t)))])

(new button%
     [parent $easy-q2-4col]
     [label "Liechtenstein"]
     [min-width $col-4]
     [min-height $big-buttons-height]
     [callback (lambda (o e) (and
                              (send $easy-two-window show #f)
                              (send $easy-three-window show #t)))])

; EASY FLAG 3

(define $easy-three-window
  (new frame%
       [label "Easy Level - Third Flag"]
       [width $window-width]
       [height $window-height]
       [border $window-padding]
       [stretchable-width #f]
       [stretchable-height #f]
       [alignment '(center center)]))

(new message% [parent $easy-three-window] [label $easy-img3])

(define $easy-q3-4col
  (new horizontal-panel%
       [parent $easy-three-window]
       [min-width 300]))

(new button%
     [parent $easy-q3-4col]
     [label "Vietnam"]
     [min-width $col-4]
     [min-height $big-buttons-height]
     [callback (lambda (o e) (and
                              (send $easy-three-window show #f)
                              (send $easy-four-window show #t)))])

(new button%
     [parent $easy-q3-4col]
     [label "Japan"]
     [min-width $col-4]
     [min-height $big-buttons-height]
     [callback (lambda (o e) (and
                              (send $easy-three-window show #f)
                              (send $easy-four-window show #t)))])

(new button%
     [parent $easy-q3-4col]
     [label "North Korea"]
     [min-width $col-4]
     [min-height $big-buttons-height]
     [callback (lambda (o e) (and
                              (send $easy-three-window show #f)
                              (send $easy-four-window show #t)))])

(new button%
     [parent $easy-q3-4col]
     [label "South Korea"]
     [min-width $col-4]
     [min-height $big-buttons-height]
     [callback (lambda (o e) (and
                              (send $easy-three-window show #f)
                              (send $easy-four-window show #t)
                              (set! $score (+ $score 1))))])

; EASY FLAG 4

(define $easy-four-window
  (new frame%
       [label "Easy Level - Fourth Flag"]
       [width $window-width]
       [height $window-height]
       [border $window-padding]
       [stretchable-width #f]
       [stretchable-height #f]
       [alignment '(center center)]))

(new message% [parent $easy-four-window] [label $easy-img4])

(define $easy-q4-4col
  (new horizontal-panel%
       [parent $easy-four-window]
       [min-width 300]))

(new button%
     [parent $easy-q4-4col]
     [label "Ireland"]
     [min-width $col-4]
     [min-height $big-buttons-height]
     [callback (lambda (o e) (and
                              (send $easy-four-window show #f)
                              (send $easy-five-window show #t)))])

(new button%
     [parent $easy-q4-4col]
     [label "Italy"]
     [min-width $col-4]
     [min-height $big-buttons-height]
     [callback (lambda (o e) (and
                              (send $easy-four-window show #f)
                              (send $easy-five-window show #t)
                              (set! $score (+ $score 1))))])                              

(new button%
     [parent $easy-q4-4col]
     [label "France"]
     [min-width $col-4]
     [min-height $big-buttons-height]
     [callback (lambda (o e) (and
                              (send $easy-four-window show #f)
                              (send $easy-five-window show #t)))])

(new button%
     [parent $easy-q4-4col]
     [label "Austria"]
     [min-width $col-4]
     [min-height $big-buttons-height]
     [callback (lambda (o e) (and
                              (send $easy-four-window show #f)
                              (send $easy-five-window show #t)))])

; EASY FLAG 5

(define $easy-five-window
  (new frame%
       [label "Easy Level - Fifth Flag"]
       [width $window-width]
       [height $window-height]
       [border $window-padding]
       [stretchable-width #f]
       [stretchable-height #f]
       [alignment '(center center)]))

(new message% [parent $easy-five-window] [label $easy-img5])

(define $easy-q5-4col
  (new horizontal-panel%
       [parent $easy-five-window]
       [min-width 300]))

(new button%
     [parent $easy-q5-4col]
     [label "Monaco"]
     [min-width $col-4]
     [min-height $big-buttons-height]
     [callback (lambda (o e)
                 (cond
                   ((equal? $score 0) (and (send $0points-result-window show #t)(send $easy-five-window show #f)))
                   ((equal? $score 1) (and (send $1point-result-window show #t)(send $easy-five-window show #f)))
                   ((equal? $score 2) (and (send $2points-result-window show #t)(send $easy-five-window show #f)))
                   ((equal? $score 3) (and (send $3points-result-window show #t)(send $easy-five-window show #f)))
                   ((equal? $score 4) (and (send $4points-result-window show #t)(send $easy-five-window show #f)))
                   ((equal? $score 5) (and (send $5points-result-window show #t)(send $easy-five-window show #f)))))])
                   
(new button%
     [parent $easy-q5-4col]
     [label "Austria"]
     [min-width $col-4]
     [min-height $big-buttons-height]
     [callback (lambda (o e)
                 (cond
                   ((equal? $score 0) (and (send $0points-result-window show #t)(send $easy-five-window show #f)))
                   ((equal? $score 1) (and (send $1point-result-window show #t)(send $easy-five-window show #f)))
                   ((equal? $score 2) (and (send $2points-result-window show #t)(send $easy-five-window show #f)))
                   ((equal? $score 3) (and (send $3points-result-window show #t)(send $easy-five-window show #f)))
                   ((equal? $score 4) (and (send $4points-result-window show #t)(send $easy-five-window show #f)))
                   ((equal? $score 5) (and (send $5points-result-window show #t)(send $easy-five-window show #f)))))])

(new button%
     [parent $easy-q5-4col]
     [label "Poland"]
     [min-width $col-4]
     [min-height $big-buttons-height]
     [callback (lambda (o e)
                 (set! $score (+ 1 $score))
                 (cond
                   ((equal? $score 0) (and (send $0points-result-window show #t)(send $easy-five-window show #f)))
                   ((equal? $score 1) (and (send $1point-result-window show #t)(send $easy-five-window show #f)))
                   ((equal? $score 2) (and (send $2points-result-window show #t)(send $easy-five-window show #f)))
                   ((equal? $score 3) (and (send $3points-result-window show #t)(send $easy-five-window show #f)))
                   ((equal? $score 4) (and (send $4points-result-window show #t)(send $easy-five-window show #f)))
                   ((equal? $score 5) (and (send $5points-result-window show #t)(send $easy-five-window show #f)))))])

(new button%
     [parent $easy-q5-4col]
     [label "Germany"]
     [min-width $col-4]
     [min-height $big-buttons-height]
     [callback (lambda (o e)
                 (cond
                   ((equal? $score 0) (and (send $0points-result-window show #t)(send $easy-five-window show #f)))
                   ((equal? $score 1) (and (send $1point-result-window show #t)(send $easy-five-window show #f)))
                   ((equal? $score 2) (and (send $2points-result-window show #t)(send $easy-five-window show #f)))
                   ((equal? $score 3) (and (send $3points-result-window show #t)(send $easy-five-window show #f)))
                   ((equal? $score 4) (and (send $4points-result-window show #t)(send $easy-five-window show #f)))
                   ((equal? $score 5) (and (send $5points-result-window show #t)(send $easy-five-window show #f)))))])               

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; MEDIUM LEVEL WINDOWS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; MEDIUM FLAG 1

(define $medium-one-window
  (new frame%
       [label "Medium Level - First Flag"]
       [width $window-width]
       [height $window-height]
       [border $window-padding]
       [stretchable-width #f]
       [stretchable-height #f]
       [alignment '(center center)]))

(new message% [parent $medium-one-window] [label $medium-img1])

(define $medium-q1-4col
  (new horizontal-panel%
       [parent $medium-one-window]
       [min-width 300]))

(new button%
     [parent $medium-q1-4col]
     [label "Mozambique"]
     [min-width $col-4]
     [min-height $big-buttons-height]
     [callback (lambda (o e)
                 (and
                  (send $medium-one-window show #f)
                  (send $medium-two-window show #t)))])

(new button%
     [parent $medium-q1-4col]
     [label "Mauritius"]
     [min-width $col-4]
     [min-height $big-buttons-height]
     [callback (lambda (o e) (and
                              (send $medium-one-window show #f)
                              (send $medium-two-window show #t)))])

(new button%
     [parent $medium-q1-4col]
     [label "South Africa"]
     [min-width $col-4]
     [min-height $big-buttons-height]
     [callback (lambda (o e) (and
                              (send $medium-one-window show #f)
                              (send $medium-two-window show #t)
                              (set! $score (+ $score 1))))])

(new button%
     [parent $medium-q1-4col]
     [label "Angola"]
     [min-width $col-4]
     [min-height $big-buttons-height]
     [callback (lambda (o e) (and
                              (send $medium-one-window show #f)
                              (send $medium-two-window show #t)))])

; MEDIUM FLAG 2

(define $medium-two-window
  (new frame%
       [label "Medium Level - Second Flag"]
       [width $window-width]
       [height $window-height]
       [border $window-padding]
       [stretchable-width #f]
       [stretchable-height #f]
       [alignment '(center center)]))

(new message% [parent $medium-two-window] [label $medium-img2])

(define $medium-q2-4col
  (new horizontal-panel%
       [parent $medium-two-window]
       [min-width 300]))

(new button%
     [parent $medium-q2-4col]
     [label "Austria"]
     [min-width $col-4]
     [min-height $big-buttons-height]
     [callback (lambda (o e)
                 (and
                  (send $medium-two-window show #f)
                  (send $medium-three-window show #t)))])

(new button%
     [parent $medium-q2-4col]
     [label "Chile"]
     [min-width $col-4]
     [min-height $big-buttons-height]
     [callback (lambda (o e) (and
                              (send $medium-two-window show #f)
                              (send $medium-three-window show #t)))])

(new button%
     [parent $medium-q2-4col]
     [label "Peru"]
     [min-width $col-4]
     [min-height $big-buttons-height]
     [callback (lambda (o e) (and
                              (send $medium-two-window show #f)
                              (send $medium-three-window show #t)
                              (set! $score (+ $score 1))))])

(new button%
     [parent $medium-q2-4col]
     [label "Egypt"]
     [min-width $col-4]
     [min-height $big-buttons-height]
     [callback (lambda (o e) (and
                              (send $medium-two-window show #f)
                              (send $medium-three-window show #t)))])

; MEDIUM FLAG 3

(define $medium-three-window
  (new frame%
       [label "Medium Level - Third Flag"]
       [width $window-width]
       [height $window-height]
       [border $window-padding]
       [stretchable-width #f]
       [stretchable-height #f]
       [alignment '(center center)]))

(new message% [parent $medium-three-window] [label $medium-img3])

(define $medium-q3-4col
  (new horizontal-panel%
       [parent $medium-three-window]
       [min-width 300]))

(new button%
     [parent $medium-q3-4col]
     [label "Singapore"]
     [min-width $col-4]
     [min-height $big-buttons-height]
     [callback (lambda (o e)
                 (and
                  (send $medium-three-window show #f)
                  (send $medium-four-window show #t)))])

(new button%
     [parent $medium-q3-4col]
     [label "Thailand"]
     [min-width $col-4]
     [min-height $big-buttons-height]
     [callback (lambda (o e) (and
                              (send $medium-three-window show #f)
                              (send $medium-four-window show #t)))])

(new button%
     [parent $medium-q3-4col]
     [label "Malaysia"]
     [min-width $col-4]
     [min-height $big-buttons-height]
     [callback (lambda (o e) (and
                              (send $medium-three-window show #f)
                              (send $medium-four-window show #t)))])

(new button%
     [parent $medium-q3-4col]
     [label "Indonesia"]
     [min-width $col-4]
     [min-height $big-buttons-height]
     [callback (lambda (o e) (and
                              (send $medium-three-window show #f)
                              (send $medium-four-window show #t)
                              (set! $score (+ $score 1))))])

; MEDIUM FLAG 4

(define $medium-four-window
  (new frame%
       [label "Medium Level - Fourth Flag"]
       [width $window-width]
       [height $window-height]
       [border $window-padding]
       [stretchable-width #f]
       [stretchable-height #f]
       [alignment '(center center)]))

(new message% [parent $medium-four-window] [label $medium-img4])

(define $medium-q4-4col
  (new horizontal-panel%
       [parent $medium-four-window]
       [min-width 300]))

(new button%
     [parent $medium-q4-4col]
     [label "Cuba"]
     [min-width $col-4]
     [min-height $big-buttons-height]
     [callback (lambda (o e)
                 (and
                  (send $medium-four-window show #f)
                  (send $medium-five-window show #t)))])

(new button%
     [parent $medium-q4-4col]
     [label "Panama"]
     [min-width $col-4]
     [min-height $big-buttons-height]
     [callback (lambda (o e) (and
                              (send $medium-four-window show #f)
                              (send $medium-five-window show #t)
                              (set! $score (+ $score 1))))])

(new button%
     [parent $medium-q4-4col]
     [label "Russia"]
     [min-width $col-4]
     [min-height $big-buttons-height]
     [callback (lambda (o e) (and
                              (send $medium-four-window show #f)
                              (send $medium-five-window show #t)))])

(new button%
     [parent $medium-q4-4col]
     [label "Qatar"]
     [min-width $col-4]
     [min-height $big-buttons-height]
     [callback (lambda (o e) (and
                              (send $medium-four-window show #f)
                              (send $medium-five-window show #t)))])

; MEDIUM FLAG 5

(define $medium-five-window
  (new frame%
       [label "Medium Level - Fifth Flag"]
       [width $window-width]
       [height $window-height]
       [border $window-padding]
       [stretchable-width #f]
       [stretchable-height #f]
       [alignment '(center center)]))

(new message% [parent $medium-five-window] [label $medium-img5])

(define $medium-q5-4col
  (new horizontal-panel%
       [parent $medium-five-window]
       [min-width 300]))

(new button%
     [parent $medium-q5-4col]
     [label "Philippines"]
     [min-width $col-4]
     [min-height $big-buttons-height]
     [callback (lambda (o e)
                 (set! $score (+ 1 $score))
                 (cond
                   ((equal? $score 0) (and (send $0points-result-window show #t)(send $medium-five-window show #f)))
                   ((equal? $score 1) (and (send $1point-result-window show #t)(send $medium-five-window show #f)))
                   ((equal? $score 2) (and (send $2points-result-window show #t)(send $medium-five-window show #f)))
                   ((equal? $score 3) (and (send $3points-result-window show #t)(send $medium-five-window show #f)))
                   ((equal? $score 4) (and (send $4points-result-window show #t)(send $medium-five-window show #f)))
                   ((equal? $score 5) (and (send $5points-result-window show #t)(send $medium-five-window show #f)))))])

(new button%
     [parent $medium-q5-4col]
     [label "Mexico"]
     [min-width $col-4]
     [min-height $big-buttons-height]
     [callback (lambda (o e)
                 (cond
                   ((equal? $score 0) (and (send $0points-result-window show #t)(send $medium-five-window show #f)))
                   ((equal? $score 1) (and (send $1point-result-window show #t)(send $medium-five-window show #f)))
                   ((equal? $score 2) (and (send $2points-result-window show #t)(send $medium-five-window show #f)))
                   ((equal? $score 3) (and (send $3points-result-window show #t)(send $medium-five-window show #f)))
                   ((equal? $score 4) (and (send $4points-result-window show #t)(send $medium-five-window show #f)))
                   ((equal? $score 5) (and (send $5points-result-window show #t)(send $medium-five-window show #f)))))])

(new button%
     [parent $medium-q5-4col]
     [label "Paraguay"]
     [min-width $col-4]
     [min-height $big-buttons-height]
     [callback (lambda (o e)
                 (cond
                   ((equal? $score 0) (and (send $0points-result-window show #t)(send $medium-five-window show #f)))
                   ((equal? $score 1) (and (send $1point-result-window show #t)(send $medium-five-window show #f)))
                   ((equal? $score 2) (and (send $2points-result-window show #t)(send $medium-five-window show #f)))
                   ((equal? $score 3) (and (send $3points-result-window show #t)(send $medium-five-window show #f)))
                   ((equal? $score 4) (and (send $4points-result-window show #t)(send $medium-five-window show #f)))
                   ((equal? $score 5) (and (send $5points-result-window show #t)(send $medium-five-window show #f)))))])

(new button%
     [parent $medium-q5-4col]
     [label "Netherlands"]
     [min-width $col-4]
     [min-height $big-buttons-height]
     [callback (lambda (o e)
                 (cond
                   ((equal? $score 0) (and (send $0points-result-window show #t)(send $medium-five-window show #f)))
                   ((equal? $score 1) (and (send $1point-result-window show #t)(send $medium-five-window show #f)))
                   ((equal? $score 2) (and (send $2points-result-window show #t)(send $medium-five-window show #f)))
                   ((equal? $score 3) (and (send $3points-result-window show #t)(send $medium-five-window show #f)))
                   ((equal? $score 4) (and (send $4points-result-window show #t)(send $medium-five-window show #f)))
                   ((equal? $score 5) (and (send $5points-result-window show #t)(send $medium-five-window show #f)))))])

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; DIFFICULT LEVEL WINDOWS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; DIFFICULT FLAG 1

(define $difficult-one-window
  (new frame%
       [label "Difficult Level - First Flag"]
       [width $window-width]
       [height $window-height]
       [border $window-padding]
       [stretchable-width #f]
       [stretchable-height #f]
       [alignment '(center center)]))

(new message% [parent $difficult-one-window] [label $difficult-img1])

(define $difficult-q1-4col
  (new horizontal-panel%
       [parent $difficult-one-window]
       [min-width 300]))

(new button%
     [parent $difficult-q1-4col]
     [label "Bhutan"]
     [min-width $col-4]
     [min-height $big-buttons-height]
     [callback (lambda (o e)
                 (and
                  (send $difficult-one-window show #f)
                  (send $difficult-two-window show #t)))])

(new button%
     [parent $difficult-q1-4col]
     [label "Mauritius"]
     [min-width $col-4]
     [min-height $big-buttons-height]
     [callback (lambda (o e) (and
                              (send $difficult-one-window show #f)
                              (send $difficult-two-window show #t)))])

(new button%
     [parent $difficult-q1-4col]
     [label "Sri Lanka"]
     [min-width $col-4]
     [min-height $big-buttons-height]
     [callback (lambda (o e) (and
                              (send $difficult-one-window show #f)
                              (send $difficult-two-window show #t)))])

(new button%
     [parent $difficult-q1-4col]
     [label "Nepal"]
     [min-width $col-4]
     [min-height $big-buttons-height]
     [callback (lambda (o e) (and
                              (send $difficult-one-window show #f)
                              (send $difficult-two-window show #t)
                              (set! $score (+ $score 1))))])

; DIFFICULT FLAG 2

(define $difficult-two-window
  (new frame%
       [label "Difficult Level - Second Flag"]
       [width $window-width]
       [height $window-height]
       [border $window-padding]
       [stretchable-width #f]
       [stretchable-height #f]
       [alignment '(center center)]))

(new message% [parent $difficult-two-window] [label $difficult-img2])

(define $difficult-q2-4col
  (new horizontal-panel%
       [parent $difficult-two-window]
       [min-width 300]))

(new button%
     [parent $difficult-q2-4col]
     [label "Tuvalu"]
     [min-width $col-4]
     [min-height $big-buttons-height]
     [callback (lambda (o e)
                 (and
                  (send $difficult-two-window show #f)
                  (send $difficult-three-window show #t)))])

(new button%
     [parent $difficult-q2-4col]
     [label "San Marino"]
     [min-width $col-4]
     [min-height $big-buttons-height]
     [callback (lambda (o e) (and
                              (send $difficult-two-window show #f)
                              (send $difficult-three-window show #t)))])

(new button%
     [parent $difficult-q2-4col]
     [label "Vatican City"]
     [min-width $col-4]
     [min-height $big-buttons-height]
     [callback (lambda (o e) (and
                              (send $difficult-two-window show #f)
                              (send $difficult-three-window show #t)))])

(new button%
     [parent $difficult-q2-4col]
     [label "Liechtenstein"]
     [min-width $col-4]
     [min-height $big-buttons-height]
     [callback (lambda (o e) (and
                              (send $difficult-two-window show #f)
                              (send $difficult-three-window show #t)
                              (set! $score (+ $score 1))))])

; DIFFICULT FLAG 3

(define $difficult-three-window
  (new frame%
       [label "Difficult Level - Third Flag"]
       [width $window-width]
       [height $window-height]
       [border $window-padding]
       [stretchable-width #f]
       [stretchable-height #f]
       [alignment '(center center)]))

(new message% [parent $difficult-three-window] [label $difficult-img3])

(define $difficult-q3-4col
  (new horizontal-panel%
       [parent $difficult-three-window]
       [min-width 300]))

(new button%
     [parent $difficult-q3-4col]
     [label "El Salvador"]
     [min-width $col-4]
     [min-height $big-buttons-height]
     [callback (lambda (o e)
                 (and
                  (send $difficult-three-window show #f)
                  (send $difficult-four-window show #t)))])

(new button%
     [parent $difficult-q3-4col]
     [label "Haiti"]
     [min-width $col-4]
     [min-height $big-buttons-height]
     [callback (lambda (o e) (and
                              (send $difficult-three-window show #f)
                              (send $difficult-four-window show #t)
                              (set! $score (+ $score 1))))])

(new button%
     [parent $difficult-q3-4col]
     [label "Liechtenstein"]
     [min-width $col-4]
     [min-height $big-buttons-height]
     [callback (lambda (o e) (and
                              (send $difficult-three-window show #f)
                              (send $difficult-four-window show #t)))])

(new button%
     [parent $difficult-q3-4col]
     [label "Trinidad and Tobago"]
     [min-width $col-4]
     [min-height $big-buttons-height]
     [callback (lambda (o e) (and
                              (send $difficult-three-window show #f)
                              (send $difficult-four-window show #t)))])

; DIFFICULT FLAG 4

(define $difficult-four-window
  (new frame%
       [label "Difficult Level - Fourth Flag"]
       [width $window-width]
       [height $window-height]
       [border $window-padding]
       [stretchable-width #f]
       [stretchable-height #f]
       [alignment '(center center)]))

(new message% [parent $difficult-four-window] [label $difficult-img4])

(define $difficult-q4-4col
  (new horizontal-panel%
       [parent $difficult-four-window]
       [min-width 300]))

(new button%
     [parent $difficult-q4-4col]
     [label "Azerbaijan"]
     [min-width $col-4]
     [min-height $big-buttons-height]
     [callback (lambda (o e)
                 (and
                  (send $difficult-four-window show #f)
                  (send $difficult-five-window show #t)
                  (set! $score (+ $score 1))))])

(new button%
     [parent $difficult-q4-4col]
     [label "Libya"]
     [min-width $col-4]
     [min-height $big-buttons-height]
     [callback (lambda (o e) (and
                              (send $difficult-four-window show #f)
                              (send $difficult-five-window show #t)))])

(new button%
     [parent $difficult-q4-4col]
     [label "Armenia"]
     [min-width $col-4]
     [min-height $big-buttons-height]
     [callback (lambda (o e) (and
                              (send $difficult-four-window show #f)
                              (send $difficult-five-window show #t)))])

(new button%
     [parent $difficult-q4-4col]
     [label "Kazakhstan"]
     [min-width $col-4]
     [min-height $big-buttons-height]
     [callback (lambda (o e) (and
                              (send $difficult-four-window show #f)
                              (send $difficult-five-window show #t)))])

; DIFFICULT FLAG 5

(define $difficult-five-window
  (new frame%
       [label "Difficult Level - Fifth Flag"]
       [width $window-width]
       [height $window-height]
       [border $window-padding]
       [stretchable-width #f]
       [stretchable-height #f]
       [alignment '(center center)]))

(new message% [parent $difficult-five-window] [label $difficult-img5])

(define $difficult-q5-4col
  (new horizontal-panel%
       [parent $difficult-five-window]
       [min-width 300]))

(new button%
     [parent $difficult-q5-4col]
     [label "Mali"]
     [min-width $col-4]
     [min-height $big-buttons-height]
     [callback (lambda (o e)
                 (cond
                   ((equal? $score 0) (and (send $0points-result-window show #t)(send $difficult-five-window show #f)))
                   ((equal? $score 1) (and (send $1point-result-window show #t)(send $difficult-five-window show #f)))
                   ((equal? $score 2) (and (send $2points-result-window show #t)(send $difficult-five-window show #f)))
                   ((equal? $score 3) (and (send $3points-result-window show #t)(send $difficult-five-window show #f)))
                   ((equal? $score 4) (and (send $4points-result-window show #t)(send $difficult-five-window show #f)))
                   ((equal? $score 5) (and (send $5points-result-window show #t)(send $difficult-five-window show #f)))))])

(new button%
     [parent $difficult-q5-4col]
     [label "Tanzania"]
     [min-width $col-4]
     [min-height $big-buttons-height]
     [callback (lambda (o e)
                 (set! $score (+ 1 $score))
                 (cond
                   ((equal? $score 0) (and (send $0points-result-window show #t)(send $difficult-five-window show #f)))
                   ((equal? $score 1) (and (send $1point-result-window show #t)(send $difficult-five-window show #f)))
                   ((equal? $score 2) (and (send $2points-result-window show #t)(send $difficult-five-window show #f)))
                   ((equal? $score 3) (and (send $3points-result-window show #t)(send $difficult-five-window show #f)))
                   ((equal? $score 4) (and (send $4points-result-window show #t)(send $difficult-five-window show #f)))
                   ((equal? $score 5) (and (send $5points-result-window show #t)(send $difficult-five-window show #f)))))])

(new button%
     [parent $difficult-q5-4col]
     [label "Madagascar"]
     [min-width $col-4]
     [min-height $big-buttons-height]
     [callback (lambda (o e)
                 (cond
                   ((equal? $score 0) (and (send $0points-result-window show #t)(send $difficult-five-window show #f)))
                   ((equal? $score 1) (and (send $1point-result-window show #t)(send $difficult-five-window show #f)))
                   ((equal? $score 2) (and (send $2points-result-window show #t)(send $difficult-five-window show #f)))
                   ((equal? $score 3) (and (send $3points-result-window show #t)(send $difficult-five-window show #f)))
                   ((equal? $score 4) (and (send $4points-result-window show #t)(send $difficult-five-window show #f)))
                   ((equal? $score 5) (and (send $5points-result-window show #t)(send $difficult-five-window show #f)))))])

(new button%
     [parent $difficult-q5-4col]
     [label "Sudan"]
     [min-width $col-4]
     [min-height $big-buttons-height]
     [callback (lambda (o e)
                 (cond
                   ((equal? $score 0) (and (send $0points-result-window show #t)(send $difficult-five-window show #f)))
                   ((equal? $score 1) (and (send $1point-result-window show #t)(send $difficult-five-window show #f)))
                   ((equal? $score 2) (and (send $2points-result-window show #t)(send $difficult-five-window show #f)))
                   ((equal? $score 3) (and (send $3points-result-window show #t)(send $difficult-five-window show #f)))
                   ((equal? $score 4) (and (send $4points-result-window show #t)(send $difficult-five-window show #f)))
                   ((equal? $score 5) (and (send $5points-result-window show #t)(send $difficult-five-window show #f)))))])

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; RESULTS WINDOWS                                                               
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; 0 POINTS WINDOW

(define $0points-result-window
  (new frame%
       [label "Result"]
       [width $window-width]
       [height $window-height]
       [border $window-padding]
       [stretchable-width #f]
       [stretchable-height #f]
       [alignment '(center center)]))

(new message% [parent $0points-result-window] [label $result-img0])

(define $0point-result-panel
  (new horizontal-panel%
       [parent $0points-result-window]
       [min-width 300]))

(new button%
     [parent $0point-result-panel]
     [label "Return to menu"]
     [min-width $big-buttons-width]
     [min-height $big-buttons-height]
     [callback (lambda (o e)
                 (and (send $0points-result-window show #f)
                      (send $main-window show #t)
                      (set! $score 0)))])

(new button%
     [parent $0point-result-panel]
     [label "Try Again"]
     [min-width $big-buttons-width]
     [min-height $big-buttons-height]
     [callback (lambda (o e)
                 (cond
                   ((equal? 0 (send $level-value get-selection)) (and (send $easy-one-window show #t)(send $0points-result-window show #f)(set! $score 0)))
                   ((equal? 1 (send $level-value get-selection)) (and (send $medium-one-window show #t)(send $0points-result-window show #f)(set! $score 0)))
                   ((equal? 2 (send $level-value get-selection)) (and (send $difficult-one-window show #t)(send $0points-result-window show #f)(set! $score 0)))))])

; 1 POINT WINDOW

(define $1point-result-window
  (new frame%
       [label "Result"]
       [width $window-width]
       [height $window-height]
       [border $window-padding]
       [stretchable-width #f]
       [stretchable-height #f]
       [alignment '(center center)]))

(new message% [parent $1point-result-window] [label $result-img1])

(define $1point-result-panel
  (new horizontal-panel%
       [parent  $1point-result-window]
       [min-width 300]))

(new button%
     [parent $1point-result-panel]
     [label "Return to menu"]
     [min-width $big-buttons-width]
     [min-height $big-buttons-height]
     [callback (lambda (o e)
                 (and (send $1point-result-window show #f)
                      (send $main-window show #t)
                      (set! $score 0)))])

(new button%
     [parent $1point-result-panel]
     [label "Try Again"]
     [min-width $big-buttons-width]
     [min-height $big-buttons-height]
     [callback (lambda (o e)
                 (cond
                   ((equal? 0 (send $level-value get-selection)) (and (send $easy-one-window show #t)(send $1point-result-window show #f)(set! $score 0)))
                   ((equal? 1 (send $level-value get-selection)) (and (send $medium-one-window show #t)(send $1point-result-window show #f)(set! $score 0)))
                   ((equal? 2 (send $level-value get-selection)) (and (send $difficult-one-window show #t)(send $1point-result-window show #f)(set! $score 0)))))])

; 2 POINTS WINDOW

(define $2points-result-window
  (new frame%
       [label "Result"]
       [width $window-width]
       [height $window-height]
       [border $window-padding]
       [stretchable-width #f]
       [stretchable-height #f]
       [alignment '(center center)]))

(new message% [parent $2points-result-window] [label $result-img2])

(define $2points-result-panel
  (new horizontal-panel%
       [parent $2points-result-window]
       [min-width 300]))

(new button%
     [parent $2points-result-panel]
     [label "Return to menu"]
     [min-width $big-buttons-width]
     [min-height $big-buttons-height]
     [callback (lambda (o e)
                 (and (send $2points-result-window show #f)
                      (send $main-window show #t)
                      (set! $score 0)))])

(new button%
     [parent $2points-result-panel]
     [label "Try Again"]
     [min-width $big-buttons-width]
     [min-height $big-buttons-height]
     [callback (lambda (o e)
                 (cond
                   ((equal? 0 (send $level-value get-selection)) (and (send $easy-one-window show #t)(send $2points-result-window show #f)(set! $score 0)))
                   ((equal? 1 (send $level-value get-selection)) (and (send $medium-one-window show #t)(send $2points-result-window show #f)(set! $score 0)))
                   ((equal? 2 (send $level-value get-selection)) (and (send $difficult-one-window show #t)(send $2points-result-window show #f)(set! $score 0)))))])

; 3 POINTS WINDOW

(define $3points-result-window
  (new frame%
       [label "Result"]
       [width $window-width]
       [height $window-height]
       [border $window-padding]
       [stretchable-width #f]
       [stretchable-height #f]
       [alignment '(center center)]))

(new message% [parent $3points-result-window] [label $result-img3])

(define $3points-result-panel
  (new horizontal-panel%
       [parent $3points-result-window]
       [min-width 300]))

(new button%
     [parent $3points-result-panel]
     [label "Return to menu"]
     [min-width $big-buttons-width]
     [min-height $big-buttons-height]
     [callback (lambda (o e)
                 (and (send $3points-result-window show #f)
                      (send $main-window show #t)
                      (set! $score 0)))])

(new button%
     [parent $3points-result-panel]
     [label "Try Again"]
     [min-width $big-buttons-width]
     [min-height $big-buttons-height]
     [callback (lambda (o e)
                 (cond
                   ((equal? 0 (send $level-value get-selection)) (and (send $easy-one-window show #t)(send $3points-result-window show #f)(set! $score 0)))
                   ((equal? 1 (send $level-value get-selection)) (and (send $medium-one-window show #t)(send $3points-result-window show #f)(set! $score 0)))
                   ((equal? 2 (send $level-value get-selection)) (and (send $difficult-one-window show #t)(send $3points-result-window show #f)(set! $score 0)))))])

; 4 POINTS WINDOW

(define $4points-result-window
  (new frame%
       [label "Result"]
       [width $window-width]
       [height $window-height]
       [border $window-padding]
       [stretchable-width #f]
       [stretchable-height #f]
       [alignment '(center center)]))

(new message% [parent $4points-result-window] [label $result-img4])

(define $4points-result-panel
  (new horizontal-panel%
       [parent $4points-result-window]
       [min-width 300]))

(new button%
     [parent $4points-result-panel]
     [label "Return to menu"]
     [min-width $big-buttons-width]
     [min-height $big-buttons-height]
     [callback (lambda (o e)
                 (and (send $4points-result-window show #f)
                      (send $main-window show #t)
                      (set! $score 0)))])

(new button%
     [parent $4points-result-panel]
     [label "Try Again"]
     [min-width $big-buttons-width]
     [min-height $big-buttons-height]
     [callback (lambda (o e)
                 (cond
                   ((equal? 0 (send $level-value get-selection)) (and (send $easy-one-window show #t)(send $4points-result-window show #f)(set! $score 0)))
                   ((equal? 1 (send $level-value get-selection)) (and (send $medium-one-window show #t)(send $4points-result-window show #f)(set! $score 0)))
                   ((equal? 2 (send $level-value get-selection)) (and (send $difficult-one-window show #t)(send $4points-result-window show #f)(set! $score 0)))))])

; 5 POINTS WINDOW

(define $5points-result-window
  (new frame%
       [label "Result"]
       [width $window-width]
       [height $window-height]
       [border $window-padding]
       [stretchable-width #f]
       [stretchable-height #f]
       [alignment '(center center)]))

(new message% [parent $5points-result-window] [label $result-img5])

(define $5points-result-panel
  (new horizontal-panel%
       [parent $5points-result-window]
       [min-width 300]))

(new button%
     [parent $5points-result-panel]
     [label "Return to menu"]
     [min-width $big-buttons-width]
     [min-height $big-buttons-height]
     [callback (lambda (o e)
                 (and (send $5points-result-window show #f)
                      (send $main-window show #t)
                      (set! $score 0)))])

(new button%
     [parent $5points-result-panel]
     [label "Try Again"]
     [min-width $big-buttons-width]
     [min-height $big-buttons-height]
     [callback (lambda (o e)
                 (cond
                   ((equal? 0 (send $level-value get-selection)) (and (send $easy-one-window show #t)(send $5points-result-window show #f)(set! $score 0)))
                   ((equal? 1 (send $level-value get-selection)) (and (send $medium-one-window show #t)(send $5points-result-window show #f)(set! $score 0)))
                   ((equal? 2 (send $level-value get-selection)) (and (send $difficult-one-window show #t)(send $5points-result-window show #f)(set! $score 0)))))])
                   
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; RUN
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(send $main-window show #t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; TEST CASES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(check-expect (= $window-width 300) #t)
(check-expect (= $window-height 600) #t)
(check-expect (<= $window-padding 20) #t)
(check-expect (= $big-buttons-width 300) #t)
(check-expect (= $big-buttons-height 50) #t)
(check-expect (= $small-buttons-height 40) #t)
(check-expect (= $col-4 125) #t)
(check-expect (>= $score 0) #t)
(check-expect (negative? $score) #f)
(check-expect (number? $easy-img1) #f)
(check-expect (string? $medium-img1) #f)
(check-expect (symbol? $difficult-img1) #f)

(test)