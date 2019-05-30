typedef enum Label {
            LEFT, RIGHT
        } Label;

typedef struct Prod_int_int {
            int fst; int snd;
        } Prod_int_int;

typedef struct Sum_unit_Prod_int_int {
            Label label;
            union {
                int left; Prod_int_int right;
            } value;
        } Sum_unit_Prod_int_int;