(use-trait ft-trait .sip-010-trait-ft-standard.sip-010-trait)

(define-private (as-trait (addr <ft-trait>))
  addr
)

;; #[allow(unchecked_data)]
(define-public (send-many
  (cfg (list 200 {
    token: principal,
    amount: uint,
    sender: principal,
    recipient: principal,
    memo: (optional (buff 34))
  })))

  (fold transfer_ cfg (ok true))
)

(define-private (transfer_
  (ctx {
    token: principal,
    amount: uint,
    sender: principal,
    recipient: principal,
    memo: (optional (buff 34))
  })
  (out (response bool uint)))

  (match out out_
    (transfer
      (try! (match (index-of CONTRACTS (get token ctx)) idx
        (ok (unwrap! (element-at TRAITS idx) (err u20)))
        (err u10)
      ))
      (get amount ctx)
      (get sender ctx)
      (get recipient ctx)
      (get memo ctx)
    )
    err_ out
  )
)

;; #[allow(unchecked_data)]
(define-public (transfer
  (ft <ft-trait>)
  (amount uint)
  (sender principal)
  (recipient principal)
  (memo (optional (buff 34))))

  (contract-call? ft transfer amount sender recipient memo)
)

(define-private (contract-of_ (ft <ft-trait>))
  (contract-of ft)
)

(define-constant CONTRACTS
  (map contract-of_ TRAITS)
)

(define-constant TRAITS (list
  (as-trait .wstx) (as-trait .wstx) (as-trait .wstx) (as-trait .wstx) (as-trait .wstx) (as-trait .wstx) (as-trait .wstx) (as-trait .wstx) (as-trait .wstx) (as-trait .wstx)
  (as-trait .wstx) (as-trait .wstx) (as-trait .wstx) (as-trait .wstx) (as-trait .wstx) (as-trait .wstx) (as-trait .wstx) (as-trait .wstx) (as-trait .wstx) (as-trait .wstx)
  (as-trait .wstx) (as-trait .wstx) (as-trait .wstx) (as-trait .wstx) (as-trait .wstx) (as-trait .wstx) (as-trait .wstx) (as-trait .wstx) (as-trait .wstx) (as-trait .wstx)
  (as-trait .wstx) (as-trait .wstx) (as-trait .wstx) (as-trait .wstx) (as-trait .wstx) (as-trait .wstx) (as-trait .wstx) (as-trait .wstx) (as-trait .wstx) (as-trait .wstx)
  (as-trait .wstx) (as-trait .wstx) (as-trait .wstx) (as-trait .wstx) (as-trait .wstx) (as-trait .wstx) (as-trait .wstx) (as-trait .wstx) (as-trait .wstx) (as-trait .wstx)
  (as-trait .wstx) (as-trait .wstx) (as-trait .wstx) (as-trait .wstx) (as-trait .wstx) (as-trait .wstx) (as-trait .wstx) (as-trait .wstx) (as-trait .wstx) (as-trait .wstx)
  (as-trait .wstx) (as-trait .wstx) (as-trait .wstx) (as-trait .wstx) (as-trait .wstx) (as-trait .wstx) (as-trait .wstx) (as-trait .wstx) (as-trait .wstx) (as-trait .wstx)
  (as-trait .wstx) (as-trait .wstx) (as-trait .wstx) (as-trait .wstx) (as-trait .wstx) (as-trait .wstx) (as-trait .wstx) (as-trait .wstx) (as-trait .wstx) (as-trait .wstx)
  (as-trait .wstx) (as-trait .wstx) (as-trait .wstx) (as-trait .wstx) (as-trait .wstx) (as-trait .wstx) (as-trait .wstx) (as-trait .wstx) (as-trait .wstx) (as-trait .wstx)
  (as-trait .wstx) (as-trait .wstx) (as-trait .wstx) (as-trait .wstx) (as-trait .wstx) (as-trait .wstx) (as-trait .wstx) (as-trait .wstx) (as-trait .wstx) (as-trait .wstx)
))
