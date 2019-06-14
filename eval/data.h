typedef enum Label {
            LEFT, RIGHT
        } Label;
typedef struct List_int {
            size_t size; int * value;
        } List_int;
typedef struct Sum_unit_int {
            Label label;
            union {
                int left; int right;
            } value;
        } Sum_unit_int;
typedef struct Prod_List_int_List_int {
            List_int fst; List_int snd;
        } Prod_List_int_List_int;
typedef struct Sum_Sum_unit_int_Prod_List_int_List_int {
            Label label;
            union {
                Sum_unit_int left; Prod_List_int_List_int right;
            } value;
        } Sum_Sum_unit_int_Prod_List_int_List_int;