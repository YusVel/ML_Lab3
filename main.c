
#include <stdint.h>

int16_t a = 0;
int16_t b = 0;
int32_t RESULT = 0;
extern long get_valid_int( long edge1, long edge2);
extern long print ( const char* msg);


int main()
{

	print("Введите переменную a: ");
	a = (int16_t)get_valid_int(-65536, 65565);
	print("Введите переменную b: ");
	b = (int16_t)get_valid_int(-65536, 65565);

	return 0;
}