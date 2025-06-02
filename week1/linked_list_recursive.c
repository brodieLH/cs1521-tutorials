#include <stdio.h>
#include <stdlib.h>

struct node {
    int data;
    struct node *next;
};

void append(struct node *head, struct node *new_node) {
    // Base Case: If the current node is the last one, attach the new node here.
    if (head->next == NULL) {
        head->next = new_node;
        new_node->next = NULL;
    } else {
        // Recursive Case: We are not at the end yet, so call append on the *next* node.
        append(head->next, new_node);
    }

}

int length(struct node *head) {
    // Base Case: If the current node is NULL, return 0.
    if (head == NULL) {
        return 0;
    } else {
        // Recursive Case: Count this node and add the length of the rest of the list.
        return 1 + length(head->next);
    }
}

struct node *new(int data) {
    struct node *node = malloc(sizeof(struct node));
    if (node == NULL) {
        fprintf(stderr, "Memory allocation failed\n");
        exit(EXIT_FAILURE);
    }
    node->data = data;
    node->next = NULL;
    return node;
}

int main(void) {
    struct node *head = new(1);
    struct node *second = new(2);
    struct node *third = new(3);

    append(head, second);
    append(head, third);

    printf("Length of linked list: %d\n", length(head));

    free(head);
    free(second);
    free(third);

    return 0;
}
