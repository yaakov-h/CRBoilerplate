/*
 --------------------------------------------------------------------
 lookup2.c, by Bob Jenkins, December 1996, Public Domain.
 hash(), hash2(), hash3, and mix() are externally useful functions.
 Routines to test the hash are included if SELF_TEST is defined.
 You can use this free for any purpose.  It has no warranty.
 
 Obsolete.  Use lookup3.c instead, it is faster and more thorough.
 --------------------------------------------------------------------
 */

#include <stdio.h>
#include <stddef.h>
#include <stdlib.h>
#include <stdint.h>
typedef  uint32_t		ub4;   /* unsigned 4-byte quantities */
typedef  unsigned char	ub1;   /* unsigned 1-byte quantities */

#define hashsize(n) ((ub4)1<<(n))
#define hashmask(n) (hashsize(n)-1)

#pragma mark -
ub4 hash ( ub1 * k, ub4 length, ub4 initval );
ub4 hash2( ub4 * k, ub4 length, ub4 initval );
ub4 hash3( ub1 * k, ub4 length, ub4 initval );

