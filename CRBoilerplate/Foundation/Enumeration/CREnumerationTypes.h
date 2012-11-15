//
// This file is subject to the software licence as defined in
// the file 'LICENCE.txt' included in this source code package.
//

// should return a bool, but the compiler confuses BOOL for int sometimes.
typedef int (^CRWhereBlock)(id item);

typedef id (^CRSelectBlock)(id item);