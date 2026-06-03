// C function to find the largest element in an array, recursively.
int max(int array[], int length) {
    int first_element = array[0]; // store in s0

    if (length == 1) {
        return first_element;
    } else {
        int max_so_far = max(&array[1], length - 1);

        if (first_element > max_so_far) {
            max_so_far = first_element;
        }
        return max_so_far;
    }
}