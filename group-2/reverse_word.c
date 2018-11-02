#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdlib.h>
#define MAXSIZE 32 // maksimalnoe kolichestvo simvolov v slove

int main()
{
	FILE *fp_in; // ukazatel faila dlya chteniya
	FILE *fp_out; // ukazatel faila dlya zapisi

	int ch = 0; // dlya hraneniya schitannogo simvola

	/*otkrytie faila dlya chteniya*/
	printf("Opening the input file <input_word.txt>\n");
	fp_in = fopen("input_word.txt", "rt");

	/*proverka otkrytiya faila dlya chteniya*/
	if (fp_in == NULL)
	{
		printf("Can not open file <input_word.txt>\n");
		system("pause");
		exit(EXIT_FAILURE);
	}


	char word[MAXSIZE + 1] = { "\0" }; // dlya hraneniya schitannogo slova celikom
	int count; // schetchik simvolov v slove

	/*schityvanie i zapis slova v massiv*/
	for (count = 0; ((ch = fgetc(fp_in)) != EOF) && count < MAXSIZE; count++)
		word[count] = ch;

    /*zakrytie i proverka zakrytiya faila dlya chteniya*/
	if (fclose(fp_in) != 0) // fclose pri uspeshom zakrytii vozrashaet 0
	{
		printf("Can not close file <input_word.txt>\n");
		//system("pause");
		exit(EXIT_FAILURE);
	}

	/*otkrytie faila dlya zapisi*/
	printf("Opening the input file <output_word.txt>\n");
	fp_out = fopen("output_word.txt", "wt");

	/*proverka otkrytiya faila dlya zapisi*/
	if (fp_out == NULL)
	{
		printf("Can not open file <output_word.txt>\n");
		//system("pause");
		exit(EXIT_FAILURE);
	}

	/*zapis slova is massiva v fail  s konca*/
	for (count--; count >= 0; count--)
		fputc(word[count], fp_out);

	/*zakrytie i proverka zakrytiya faila dlya zapisi*/
	if (fclose(fp_out) != 0) // fclose pri uspeshom zakrytii vozrashaet 0
	{
		printf("Can not close file <output_word.txt>\n");
		//system("pause");
		exit(EXIT_FAILURE);
	}

	//system("pause");
	return 0;
}