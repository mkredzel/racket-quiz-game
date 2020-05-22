#lang racket
 
(define make-machine 
  (λ (states alphabet transitions star-statet end-states)
    (list states alphabet transitions star-statet end-states)))

(define states (λ (x) (first x)))
(define alphabet (λ (x) (second x)))
(define transitions (λ (x) (third x)))
(define start (λ (x) (fourth x)))
(define endstates (λ (x) (fifth x)))

(define next-state (λ (state input machine) 
                     (cond
                       ((empty? (transitions machine)) "not possible")
                       ((equal? (list state input) (first (first (transitions machine))))
                        (second (first (transitions machine))))
                       (#t (next-state state input 
                                       (make-machine 
                                        (states machine) 
                                        (alphabet machine)
                                        (rest (transitions machine))
                                        (start machine)
                                        (endstates machine)))))))
            

(define run-machine1 (λ (state input-list machine)
                       (cond 
                         ((empty? input-list) state)
                         ((not (is-transition-in? 
                                (list state (first input-list) ) (transitions machine))) "not possible")
                         (#t (run-machine1 
                              (next-state state (first input-list) machine)
                              (rest input-list)
                              machine)))))

(define run-machine (λ (input-list machine)
                      (run-machine1 (start machine) input-list machine)))

(define is-transition-in? (λ (state-input-pair list-of-transitions)
                            (cond
                              ((empty? list-of-transitions) #f)
                              ((equal? state-input-pair (first (first list-of-transitions))) #t)
                              (#t (is-transition-in? state-input-pair (rest list-of-transitions))))))
            
(define sentence-accepted? (λ (sentence machine)
                             (member (run-machine sentence machine)
                                     (endstates machine))))

(define QUIZGAME 
  (make-machine
   '(MainWindow OffState LicenseWindow RulesWindow DifficultyChoiceWindow EQ1 EQ2 EQ3 EQ4 EQ5 EasyScoreWindow MQ1 MQ2 MQ3 MQ4 MQ5 MediumScoreWindow DQ1 DQ2 DQ3 DQ4 DQ5 DifficultScoreWindow)
   '(NewGameButton RulesButton LicenseButton ExitButton ReturnButton EasyLevelSubmit MediumLevelSubmit DifficultLevelSubmit a b c d TryAgainButton ReturnToMenuButton)
   '(((MainWindow RulesButton) RulesWindow)
     ((MainWindow LicenseButton) LicenseWindow)
     ((LicenseWindow ReturnButton) MainWindow)
     ((RulesWindow ReturnButton) MainWindow)
     ((MainWindow ExitButton) OffState)
     ((MainWindow NewGameButton) DifficultyChoiceWindow)
     ((DifficultyChoiceWindow EasyLevelSubmit) EQ1)
     ((DifficultyChoiceWindow MediumLevelSubmit) MQ1)
     ((DifficultyChoiceWindow DifficultLevelSubmit) DQ1)
     ((EQ1 a) EQ2)
     ((EQ1 b) EQ2)
     ((EQ1 c) EQ2)
     ((EQ1 d) EQ2)
     ((EQ2 a) EQ3)
     ((EQ2 b) EQ3)
     ((EQ2 c) EQ3)
     ((EQ2 d) EQ3)
     ((EQ3 a) EQ4)
     ((EQ3 b) EQ4)
     ((EQ3 c) EQ4)
     ((EQ3 d) EQ4)
     ((EQ4 a) EQ5)
     ((EQ4 b) EQ5)
     ((EQ4 c) EQ5)
     ((EQ4 d) EQ5)
     ((MQ1 a) MQ2)
     ((MQ1 b) MQ2)
     ((MQ1 c) MQ2)
     ((MQ1 d) MQ2)
     ((MQ2 a) MQ3)
     ((MQ2 b) MQ3)
     ((MQ2 c) MQ3)
     ((MQ2 d) MQ3)
     ((MQ3 a) MQ4)
     ((MQ3 b) MQ4)
     ((MQ3 c) MQ4)
     ((MQ3 d) MQ4)
     ((MQ4 a) MQ5)
     ((MQ4 b) MQ5)
     ((MQ4 c) MQ5)
     ((MQ4 d) MQ5)
     ((DQ1 a) DQ2)
     ((DQ1 b) DQ2)
     ((DQ1 c) DQ2)
     ((DQ1 d) DQ2)
     ((DQ2 a) DQ3)
     ((DQ2 b) DQ3)
     ((DQ2 c) DQ3)
     ((DQ2 d) DQ3)
     ((DQ3 a) DQ4)
     ((DQ3 b) DQ4)
     ((DQ3 c) DQ4)
     ((DQ3 d) DQ4)
     ((DQ4 a) DQ5)
     ((DQ4 b) DQ5)
     ((DQ4 c) DQ5)
     ((DQ4 d) DQ5)
     ((EQ5 a) EasyScoreWindow)
     ((EQ5 b) EasyScoreWindow)
     ((EQ5 c) EasyScoreWindow)
     ((EQ5 d) EasyScoreWindow)
     ((MQ5 a) MediumScoreWindow)
     ((MQ5 b) MediumScoreWindow)
     ((MQ5 c) MediumScoreWindow)
     ((MQ5 d) MediumScoreWindow)
     ((DQ5 a) DifficultScoreWindow)
     ((DQ5 b) DifficultScoreWindow)
     ((DQ5 c) DifficultScoreWindow)
     ((DQ5 d) DifficultScoreWindow)
     ((EasyScoreWindow TryAgainButton) EQ1)
     ((MediumScoreWindow TryAgainButton) MQ1)
     ((DifficultScoreWindow TryAgainButton) DQ1)
     ((EasyScoreWindow ReturnToMenuButton) MainWindow)
     ((MediumScoreWindow ReturnToMenuButton) MainWindow)
     ((DifficultScoreWindow ReturnToMenuButton) MainWindow))
     'MainWindow
   '(OffState)))



;EXAMPLES OF RUNS
;> (next-state 'MainWindow 'RulesButton QUIZGAME)
;'RulesWindow
;> (run-machine '(NewGameButton EasyLevelSubmit) QUIZGAME)
;'EQ1
;> (run-machine '(NewGameButton EasyLevelSubmit a a b c d) QUIZGAME)
;'EasyScoreWindow