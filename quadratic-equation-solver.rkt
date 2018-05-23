#lang racket
(require db)
 (define pgc
   (mysql-connect
            #:user "your-MySQL-Username"
            #:database "racket"
            #:server "localhost"
            #:password "your-MySQL-password"
  )
)

(define (bhaskara a b c)
  (define delta (sqrt (- (* b b) (* 4.0 a c))))
  (define x1 (/ (+ (- b) delta) (* 2.0 a)))
  (define x2 (/ (- (- b) delta) (* 2.0 a)))
  (define Vx (/ (- b) (* 2.0 a)))
  (define Vy (/ (- delta) (* 4.0 a)))

  (query-exec pgc "INSERT INTO bhaskara (a, b, c, delta, x1, x2, Vx, Vy) VALUES (?, ?, ?, ?, ?, ?, ?, ?)"
                a b c delta x1 x2 Vx Vy)

  (query-rows pgc "SELECT * FROM bhaskara");

)