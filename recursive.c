/*
 ============================================================================
 Name        : recursive.c
 Author      : Sergio
 Version     :
 Copyright   : Your copyright notice
 Description : Hello World in C, Ansi-style
 ============================================================================
 */

#include <stdio.h>

int power(int n1, int n2);

int main()
{
    int base = 2, potencia, result;
    printf("Enter power number(positive integer): ");
    scanf("%d",&potencia);

    result = power(base, potencia);
    printf("%d^%d = %d", base, potencia, result);
    return 0;
}
int power(int base, int powerRaised)
{
    if (powerRaised != 0)
        return (base*power(base, powerRaised-1));
    else
        return 1;
}
