#include <stdint.h>

int16_t a = 0;
int16_t b = 0;
int32_t RESULT = 0;
extern long get_valid_int( long edge1, long edge2);
extern long print (const char* msg);
extern long p_rax (long rdi);
extern long calculate();


int main()
{ /*
	print("Введите переменные a,b (int16_t)\n");
	print("Введите переменную a: ");
	a = (int16_t)get_valid_int(-65536, 65565);
	print("Введите переменную b: ");
	b = (int16_t)get_valid_int(-65536, 65565);

	if(a==b)
	{
		RESULT=11;
	}
	else if(a<b)
	{
		RESULT = (int)(a*a/b);
	}
	else
	{
		RESULT= (int)(b*a/11);
	}
	print("RESULT (на Си) = "); p_rax(RESULT);print("\n");     */
	calculate();
	print("RESULT (на ASM) = "); p_rax(RESULT);print("\n"); 
	return 0;
}