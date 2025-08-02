#include <stdio.h>
#include <stdlib.h>

struct node {
    int data;
    struct node *next;
};

void append(struct node *head, struct node *new_node) {
    struct node *current = head;

    while (current->next != NULL) {
        current = current->next;
    }

    current->next = new_node;
    new_node->next = NULL;
}

int length(struct node *head) {
    int count = 0;
    struct node *current = head;

    while (current != NULL) {
        count++; 
        current = current->next; 
    }
    return count;
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
