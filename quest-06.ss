(load "../aoc/load.ss")

(define (string-split S sep)
  (string-tokenize S (char-set-complement (apply char-set (string->list sep)))))

(define tree (make-hashtable string-hash string=?))
(define eert (make-hashtable string-hash string=?))
(define input (with-input-from-file "input/06a.in" lines-raw))
(define fruit "@")
;; populate hashtables for parent/child relationships
(define (populate)
  (for-each (lambda (line)
              (let* ((edges (string-split line ":"))
                     (parent (car edges))
                     (children (string-split (cadr edges) ",")))
		(for-each (lambda (child)
                            (cond ((equal? child fruit)
                                   (hashtable-set! eert
						   fruit
						   (cons parent
							 (hashtable-ref eert fruit '()))))
                                  (else (hashtable-set! eert child parent))))
                          children)
		(hashtable-set! tree parent children)))
            input))

(define (path-to-root node)
  (match (hashtable-ref eert node #f)
    (#f (list node))
    (parent (cons node (path-to-root parent)))))

(define (part-a)
  (define nodes (hashtable-ref eert fruit '()))
  (define paths (map path-to-root nodes))
  (define powerful-length
    (cdr (assq 1 (map swap (eq-histogram (map length paths))))))
  (define powerful-fruit
    (car (filter (lambda (path)
		   (= powerful-length (length path)))
		 paths)))
  (apply string-append (reverse (cons fruit powerful-fruit))))

(define tree (make-hashtable string-hash string=?))
(define eert (make-hashtable string-hash string=?))
(define input (with-input-from-file "input/06b.in" lines-raw))
(populate)

(define (part-b)
  (define nodes (hashtable-ref eert fruit '()))
  (define paths (map path-to-root nodes))
  (define powerful-length
    (cdr (assq 1 (map swap (eq-histogram (map length paths))))))
  (define powerful-fruit
    (car (filter (lambda (path)
		   (= powerful-length (length path)))
		 paths)))
  (list->string
   (map (lambda (node)
	  (string-ref node 0))
	(reverse (cons fruit powerful-fruit)))))

(define tree (make-hashtable string-hash string=?))
(define eert (make-hashtable string-hash string=?))
(define input (with-input-from-file "input/06c.in" lines-raw))
(populate)

;; infinite path...
(define (part-c)
  (define nodes
    (let ((ps (hashtable-ref eert fruit '())))
      (cons (car ps)
	    (cddr ps))))
  (define paths (map path-to-root nodes))
  (define powerful-length
    (cdr (assq 1 (map swap (eq-histogram (map length paths))))))
  (define powerful-fruit
    (car (filter (lambda (path)
		   (= powerful-length (length path)))
		 paths)))
  (list->string
   (map (lambda (node)
	  (string-ref node 0))
	(reverse (cons fruit powerful-fruit)))))
