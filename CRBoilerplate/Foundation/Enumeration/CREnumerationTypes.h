
// should return a bool, but the compiler confuses BOOL for int sometimes.
typedef int (^CRWhereBlock)(id item);

typedef id (^CRSelectBlock)(id item);