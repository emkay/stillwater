;; @TODO: probably don't need this anymore if using filter-by-type below.
;; Find an object with a given property value
(define (find-object-by-property objects key value)
  (if (null? objects)
      nil
      (if (= (hash-get (car objects) key) value)
          (car objects)
          (find-object-by-property (cdr objects) key value))))

;; Filter ALL objects matching a property (not just first)
(define (filter-by-type objects type)
  (if (null? objects)
      '()
      (if (= (hash-get (car objects) "type") type)
          (cons (car objects) (filter-by-type (cdr objects) type))
          (filter-by-type (cdr objects) type))))

;; Find first item in list matching predicate
(define (find-first pred lst)
  (if (null? lst)
      nil
      (if (pred (car lst))
          (car lst)
          (find-first pred (cdr lst)))))

;; Check if player is directly below an object
(define (player-below? obj)
  (let ((ox (/ (hash-get obj "x") tile-size))
        (oy (/ (hash-get obj "y") tile-size)))
    (and (= player-x ox)
         (= player-y (+ oy 1)))))

;; Find object of type that player is below
(define (object-player-below type)
  (find-first player-below? (filter-by-type (map-objects room) type)))
