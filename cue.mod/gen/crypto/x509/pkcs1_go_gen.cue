// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go crypto/x509

package x509

// pkcs1PrivateKey is a structure which mirrors the PKCS #1 ASN.1 for an RSA private key.
_#pkcs1PrivateKey: {
	Version: int
	N?:      null | int @go(,*big.Int)
	E:       int
	D?:      null | int @go(,*big.Int)
	P?:      null | int @go(,*big.Int)
	Q?:      null | int @go(,*big.Int)

	// We ignore these values, if present, because rsa will calculate them.
	Dp?:   null | int @go(,*big.Int)
	Dq?:   null | int @go(,*big.Int)
	Qinv?: null | int @go(,*big.Int)
	AdditionalPrimes: [..._#pkcs1AdditionalRSAPrime] @go(,[]pkcs1AdditionalRSAPrime)
}

_#pkcs1AdditionalRSAPrime: {
	Prime?: null | int @go(,*big.Int)

	// We ignore these values because rsa will calculate them.
	Exp?:   null | int @go(,*big.Int)
	Coeff?: null | int @go(,*big.Int)
}

// pkcs1PublicKey reflects the ASN.1 structure of a PKCS #1 public key.
_#pkcs1PublicKey: {
	N?: null | int @go(,*big.Int)
	E:  int
}
